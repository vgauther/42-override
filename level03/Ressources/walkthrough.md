​```shell
level03@OverRide:~$ ./level03
***********************************
*		level03		**
***********************************
Password:test

Invalid Password
​```

## Analyse statique

Sous `gdb`, `info functions` fait ressortir trois fonctions : `main`, `test`
et `decrypt`. On les désassemble et on les traduit en C.

En lisant `decrypt`, on remarque un appel à **`system("/bin/sh")`** : c'est
par là qu'on va passer.

## Chemin vers system("/bin/sh")

Pour atteindre le `system("/bin/sh")`, il faut que la comparaison réussisse :

​```c
strncmp(buf, "Congratulations!", 17) == 0
​```

`buf` est un tableau de 16 octets chiffrés, décodé octet par octet par un
XOR à clé unique :

​```c
buf[i] = secret[i] ^ key;
​```

Il suffit donc que le déchiffrement redonne `"Congratulations!"`. On résout
la clé à partir du premier octet :

​```
secret[0] = 0x51   ('C' = 0x43 attendu)
key = 0x51 ^ 0x43 = 0x12 = 18
​```

(On peut vérifier que la même clé 18 décode bien les 16 octets en
`Congratulations!`.)

## Remonter jusqu'à l'entrée utilisateur

D'après `main` et `test`, la clé passée à `decrypt` vaut :

​```
key = 0x1337d00d - input
​```

Donc :

​```
input = 0x1337d00d - 18 = 322424827
​```

(À noter : `test` n'appelle `decrypt(key)` que si `key` ∈ [0, 21] ; sinon il
part sur `decrypt(rand())`. La valeur 18 est bien dans l'intervalle, on tombe
donc sur le bon chemin.)

## Exploitation

​```shell
level03@OverRide:~$ ./level03
***********************************
*		level03		**
***********************************
Password:322424827
$
​```

On obtient un shell. Il ne reste qu'à lire le mot de passe du niveau suivant :

​```shell
$ cat /home/users/level04/.pass
​```