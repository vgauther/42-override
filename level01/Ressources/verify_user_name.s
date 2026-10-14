0x08048464 <+0>:	push   %ebp
0x08048465 <+1>:	mov    %esp,%ebp
0x08048467 <+3>:	push   %edi
0x08048468 <+4>:	push   %esi
0x08048469 <+5>:	sub    $0x10,%esp
0x0804846c <+8>:	movl   $0x8048690,(%esp)
0x08048473 <+15>:	call   0x8048380 <puts@plt>
0x08048478 <+20>:	mov    $0x804a040,%edx
0x0804847d <+25>:	mov    $0x80486a8,%eax
0x08048482 <+30>:	mov    $0x7,%ecx
0x08048487 <+35>:	mov    %edx,%esi
0x08048489 <+37>:	mov    %eax,%edi
0x0804848b <+39>:	repz cmpsb %es:(%edi),%ds:(%esi)
0x0804848d <+41>:	seta   %dl
0x08048490 <+44>:	setb   %al
0x08048493 <+47>:	mov    %edx,%ecx
0x08048495 <+49>:	sub    %al,%cl
0x08048497 <+51>:	mov    %ecx,%eax
0x08048499 <+53>:	movsbl %al,%eax
0x0804849c <+56>:	add    $0x10,%esp
0x0804849f <+59>:	pop    %esi
0x080484a0 <+60>:	pop    %edi
0x080484a1 <+61>:	pop    %ebp
0x080484a2 <+62>:	ret