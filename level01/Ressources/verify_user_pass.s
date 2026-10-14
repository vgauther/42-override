0x080484a3 <+0>:	push   %ebp
0x080484a4 <+1>:	mov    %esp,%ebp
0x080484a6 <+3>:	push   %edi
0x080484a7 <+4>:	push   %esi
0x080484a8 <+5>:	mov    0x8(%ebp),%eax
0x080484ab <+8>:	mov    %eax,%edx
0x080484ad <+10>:	mov    $0x80486b0,%eax
0x080484b2 <+15>:	mov    $0x5,%ecx
0x080484b7 <+20>:	mov    %edx,%esi
0x080484b9 <+22>:	mov    %eax,%edi
0x080484bb <+24>:	repz cmpsb %es:(%edi),%ds:(%esi)
0x080484bd <+26>:	seta   %dl
0x080484c0 <+29>:	setb   %al
0x080484c3 <+32>:	mov    %edx,%ecx
0x080484c5 <+34>:	sub    %al,%cl
0x080484c7 <+36>:	mov    %ecx,%eax
0x080484c9 <+38>:	movsbl %al,%eax
0x080484cc <+41>:	pop    %esi
0x080484cd <+42>:	pop    %edi
0x080484ce <+43>:	pop    %ebp
0x080484cf <+44>:	ret