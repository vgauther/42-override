0x08048747 <+0>:	push   %ebp
0x08048748 <+1>:	mov    %esp,%ebp
0x0804874a <+3>:	sub    $0x28,%esp
0x0804874d <+6>:	mov    0x8(%ebp),%eax
0x08048750 <+9>:	mov    0xc(%ebp),%edx
0x08048753 <+12>:	mov    %edx,%ecx
0x08048755 <+14>:	sub    %eax,%ecx
0x08048757 <+16>:	mov    %ecx,%eax
0x08048759 <+18>:	mov    %eax,-0xc(%ebp)
0x0804875c <+21>:	cmpl   $0x15,-0xc(%ebp)
0x08048760 <+25>:	ja     0x804884a <test+259>
0x08048766 <+31>:	mov    -0xc(%ebp),%eax
0x08048769 <+34>:	shl    $0x2,%eax
0x0804876c <+37>:	add    $0x80489f0,%eax
0x08048771 <+42>:	mov    (%eax),%eax
0x08048773 <+44>:	jmp    *%eax
0x08048775 <+46>:	mov    -0xc(%ebp),%eax
0x08048778 <+49>:	mov    %eax,(%esp)
0x0804877b <+52>:	call   0x8048660 <decrypt>
0x08048780 <+57>:	jmp    0x8048858 <test+273>
0x08048785 <+62>:	mov    -0xc(%ebp),%eax
0x08048788 <+65>:	mov    %eax,(%esp)
0x0804878b <+68>:	call   0x8048660 <decrypt>
0x08048790 <+73>:	jmp    0x8048858 <test+273>
0x08048795 <+78>:	mov    -0xc(%ebp),%eax
0x08048798 <+81>:	mov    %eax,(%esp)
0x0804879b <+84>:	call   0x8048660 <decrypt>
0x080487a0 <+89>:	jmp    0x8048858 <test+273>
0x080487a5 <+94>:	mov    -0xc(%ebp),%eax
0x080487a8 <+97>:	mov    %eax,(%esp)
0x080487ab <+100>:	call   0x8048660 <decrypt>
0x080487b0 <+105>:	jmp    0x8048858 <test+273>
0x080487b5 <+110>:	mov    -0xc(%ebp),%eax
0x080487b8 <+113>:	mov    %eax,(%esp)
0x080487bb <+116>:	call   0x8048660 <decrypt>
0x080487c0 <+121>:	jmp    0x8048858 <test+273>
0x080487c5 <+126>:	mov    -0xc(%ebp),%eax
0x080487c8 <+129>:	mov    %eax,(%esp)
0x080487cb <+132>:	call   0x8048660 <decrypt>
0x080487d0 <+137>:	jmp    0x8048858 <test+273>
0x080487d5 <+142>:	mov    -0xc(%ebp),%eax
0x080487d8 <+145>:	mov    %eax,(%esp)
0x080487db <+148>:	call   0x8048660 <decrypt>
0x080487e0 <+153>:	jmp    0x8048858 <test+273>
0x080487e2 <+155>:	mov    -0xc(%ebp),%eax
0x080487e5 <+158>:	mov    %eax,(%esp)
0x080487e8 <+161>:	call   0x8048660 <decrypt>
0x080487ed <+166>:	jmp    0x8048858 <test+273>
0x080487ef <+168>:	mov    -0xc(%ebp),%eax
0x080487f2 <+171>:	mov    %eax,(%esp)
0x080487f5 <+174>:	call   0x8048660 <decrypt>
0x080487fa <+179>:	jmp    0x8048858 <test+273>
0x080487fc <+181>:	mov    -0xc(%ebp),%eax
0x080487ff <+184>:	mov    %eax,(%esp)
0x08048802 <+187>:	call   0x8048660 <decrypt>
0x08048807 <+192>:	jmp    0x8048858 <test+273>
0x08048809 <+194>:	mov    -0xc(%ebp),%eax
0x0804880c <+197>:	mov    %eax,(%esp)
0x0804880f <+200>:	call   0x8048660 <decrypt>
0x08048814 <+205>:	jmp    0x8048858 <test+273>
0x08048816 <+207>:	mov    -0xc(%ebp),%eax
0x08048819 <+210>:	mov    %eax,(%esp)
0x0804881c <+213>:	call   0x8048660 <decrypt>
0x08048821 <+218>:	jmp    0x8048858 <test+273>
0x08048823 <+220>:	mov    -0xc(%ebp),%eax
0x08048826 <+223>:	mov    %eax,(%esp)
0x08048829 <+226>:	call   0x8048660 <decrypt>
0x0804882e <+231>:	jmp    0x8048858 <test+273>
0x08048830 <+233>:	mov    -0xc(%ebp),%eax
0x08048833 <+236>:	mov    %eax,(%esp)
0x08048836 <+239>:	call   0x8048660 <decrypt>
0x0804883b <+244>:	jmp    0x8048858 <test+273>
0x0804883d <+246>:	mov    -0xc(%ebp),%eax
0x08048840 <+249>:	mov    %eax,(%esp)
0x08048843 <+252>:	call   0x8048660 <decrypt>
0x08048848 <+257>:	jmp    0x8048858 <test+273>
0x0804884a <+259>:	call   0x8048520 <rand@plt>
0x0804884f <+264>:	mov    %eax,(%esp)
0x08048852 <+267>:	call   0x8048660 <decrypt>
0x08048857 <+272>:	nop
0x08048858 <+273>:	leave
0x08048859 <+274>:	ret