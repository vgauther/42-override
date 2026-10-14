0x08048660 <+0>:	push   %ebp
0x08048661 <+1>:	mov    %esp,%ebp
0x08048663 <+3>:	push   %edi
0x08048664 <+4>:	push   %esi
0x08048665 <+5>:	sub    $0x40,%esp
0x08048668 <+8>:	mov    %gs:0x14,%eax
0x0804866e <+14>:	mov    %eax,-0xc(%ebp)
0x08048671 <+17>:	xor    %eax,%eax
0x08048673 <+19>:	movl   $0x757c7d51,-0x1d(%ebp)
0x0804867a <+26>:	movl   $0x67667360,-0x19(%ebp)
0x08048681 <+33>:	movl   $0x7b66737e,-0x15(%ebp)
0x08048688 <+40>:	movl   $0x33617c7d,-0x11(%ebp)
0x0804868f <+47>:	movb   $0x0,-0xd(%ebp)
0x08048693 <+51>:	push   %eax
0x08048694 <+52>:	xor    %eax,%eax
0x08048696 <+54>:	je     0x804869b <decrypt+59>
0x08048698 <+56>:	add    $0x4,%esp
0x0804869b <+59>:	pop    %eax
0x0804869c <+60>:	lea    -0x1d(%ebp),%eax
0x0804869f <+63>:	movl   $0xffffffff,-0x2c(%ebp)
0x080486a6 <+70>:	mov    %eax,%edx
0x080486a8 <+72>:	mov    $0x0,%eax
0x080486ad <+77>:	mov    -0x2c(%ebp),%ecx
0x080486b0 <+80>:	mov    %edx,%edi
0x080486b2 <+82>:	repnz scas %es:(%edi),%al
0x080486b4 <+84>:	mov    %ecx,%eax
0x080486b6 <+86>:	not    %eax
0x080486b8 <+88>:	sub    $0x1,%eax
0x080486bb <+91>:	mov    %eax,-0x24(%ebp)
0x080486be <+94>:	movl   $0x0,-0x28(%ebp)
0x080486c5 <+101>:	jmp    0x80486e5 <decrypt+133>
0x080486c7 <+103>:	lea    -0x1d(%ebp),%eax
0x080486ca <+106>:	add    -0x28(%ebp),%eax
0x080486cd <+109>:	movzbl (%eax),%eax
0x080486d0 <+112>:	mov    %eax,%edx
0x080486d2 <+114>:	mov    0x8(%ebp),%eax
0x080486d5 <+117>:	xor    %edx,%eax
0x080486d7 <+119>:	mov    %eax,%edx
0x080486d9 <+121>:	lea    -0x1d(%ebp),%eax
0x080486dc <+124>:	add    -0x28(%ebp),%eax
0x080486df <+127>:	mov    %dl,(%eax)
0x080486e1 <+129>:	addl   $0x1,-0x28(%ebp)
0x080486e5 <+133>:	mov    -0x28(%ebp),%eax
0x080486e8 <+136>:	cmp    -0x24(%ebp),%eax
0x080486eb <+139>:	jb     0x80486c7 <decrypt+103>
0x080486ed <+141>:	lea    -0x1d(%ebp),%eax
0x080486f0 <+144>:	mov    %eax,%edx
0x080486f2 <+146>:	mov    $0x80489c3,%eax
0x080486f7 <+151>:	mov    $0x11,%ecx
0x080486fc <+156>:	mov    %edx,%esi
0x080486fe <+158>:	mov    %eax,%edi
0x08048700 <+160>:	repz cmpsb %es:(%edi),%ds:(%esi)
0x08048702 <+162>:	seta   %dl
0x08048705 <+165>:	setb   %al
0x08048708 <+168>:	mov    %edx,%ecx
0x0804870a <+170>:	sub    %al,%cl
0x0804870c <+172>:	mov    %ecx,%eax
0x0804870e <+174>:	movsbl %al,%eax
0x08048711 <+177>:	test   %eax,%eax
0x08048713 <+179>:	jne    0x8048723 <decrypt+195>
0x08048715 <+181>:	movl   $0x80489d4,(%esp)
0x0804871c <+188>:	call   0x80484e0 <system@plt>
0x08048721 <+193>:	jmp    0x804872f <decrypt+207>
0x08048723 <+195>:	movl   $0x80489dc,(%esp)
0x0804872a <+202>:	call   0x80484d0 <puts@plt>
0x0804872f <+207>:	mov    -0xc(%ebp),%esi
0x08048732 <+210>:	xor    %gs:0x14,%esi
0x08048739 <+217>:	je     0x8048740 <decrypt+224>
0x0804873b <+219>:	call   0x80484c0 <__stack_chk_fail@plt>
0x08048740 <+224>:	add    $0x40,%esp
0x08048743 <+227>:	pop    %esi
0x08048744 <+228>:	pop    %edi
0x08048745 <+229>:	pop    %ebp
0x08048746 <+230>:	ret