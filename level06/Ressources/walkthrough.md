Le programme vérifie le nom d'utilisateur et le numéro de série, et utilise ptrace pour détecter l'usage de gdb. On peut modifier la valeur retournée par ptrace pour contourner ce contrôle.

```
(gdb) b *0x080487ba
Breakpoint 1 at 0x80487ba
(gdb) b *0x08048866
Breakpoint 2 at 0x8048866
(gdb) r
Starting program: /home/users/level06/level06
***********************************
*               level06           *
***********************************
-> Enter Login: thou42
***********************************
***** NEW ACCOUNT DETECTED ********
***********************************
-> Enter Serial: 111

Breakpoint 1, 0x080487ba in auth ()
(gdb) p $eax
$1 = -1
(gdb) set $eax=0
(gdb) c
Continuing.

Breakpoint 2, 0x08048866 in auth ()
(gdb) x/wx $ebp-0x10
0xffffd5b8:     0x005f1b38
(gdb) p 0x005f1b38
$2 = 6232888
(gdb)
```

Comme le numéro de série attendu est calculé par le programme lui-même, on peut reproduire l'algorithme de génération du serial, et ainsi générer n'importe quel couple nom d'utilisateur / numéro de série valide.