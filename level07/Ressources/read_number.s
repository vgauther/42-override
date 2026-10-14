0x080486d7 <+0>:     push   %ebp
0x080486d8 <+1>:     mov    %esp,%ebp
0x080486da <+3>:     sub    $0x28,%esp
0x080486dd <+6>:     movl   $0x0,-0xc(%ebp)
0x080486e4 <+13>:    mov    $0x8048add,%eax
0x080486e9 <+18>:    mov    %eax,(%esp)
0x080486ec <+21>:    call   0x8048470 <printf@plt>
0x080486f1 <+26>:    call   0x80485e7 <get_unum>
0x080486f6 <+31>:    mov    %eax,-0xc(%ebp)
0x080486f9 <+34>:    mov    -0xc(%ebp),%eax
0x080486fc <+37>:    shl    $0x2,%eax
0x080486ff <+40>:    add    0x8(%ebp),%eax
0x08048702 <+43>:    mov    (%eax),%edx
0x08048704 <+45>:    mov    $0x8048b1b,%eax
0x08048709 <+50>:    mov    %edx,0x8(%esp)
0x0804870d <+54>:    mov    -0xc(%ebp),%edx
0x08048710 <+57>:    mov    %edx,0x4(%esp)
0x08048714 <+61>:    mov    %eax,(%esp)
0x08048717 <+64>:    call   0x8048470 <printf@plt>
0x0804871c <+69>:    mov    $0x0,%eax
0x08048721 <+74>:    leave  
0x08048722 <+75>:    ret