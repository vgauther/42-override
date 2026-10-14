0x08048879 <+0>:     push   %ebp
0x0804887a <+1>:     mov    %esp,%ebp
0x0804887c <+3>:     and    $0xfffffff0,%esp
0x0804887f <+6>:     sub    $0x50,%esp
0x08048882 <+9>:     mov    0xc(%ebp),%eax
0x08048885 <+12>:    mov    %eax,0x1c(%esp)
0x08048889 <+16>:    mov    %gs:0x14,%eax
0x0804888f <+22>:    mov    %eax,0x4c(%esp)
0x08048893 <+26>:    xor    %eax,%eax
0x08048895 <+28>:    push   %eax
0x08048896 <+29>:    xor    %eax,%eax
0x08048898 <+31>:    je     0x804889d <main+36>
0x0804889a <+33>:    add    $0x4,%esp
0x0804889d <+36>:    pop    %eax
0x0804889e <+37>:    movl   $0x8048ad4,(%esp)
0x080488a5 <+44>:    call   0x8048590 <puts@plt>
0x080488aa <+49>:    movl   $0x8048af8,(%esp)
0x080488b1 <+56>:    call   0x8048590 <puts@plt>
0x080488b6 <+61>:    movl   $0x8048ad4,(%esp)
0x080488bd <+68>:    call   0x8048590 <puts@plt>
0x080488c2 <+73>:    mov    $0x8048b08,%eax
0x080488c7 <+78>:    mov    %eax,(%esp)
0x080488ca <+81>:    call   0x8048510 <printf@plt>
0x080488cf <+86>:    mov    0x804a060,%eax
0x080488d4 <+91>:    mov    %eax,0x8(%esp)
0x080488d8 <+95>:    movl   $0x20,0x4(%esp)
0x080488e0 <+103>:   lea    0x2c(%esp),%eax
0x080488e4 <+107>:   mov    %eax,(%esp)
0x080488e7 <+110>:   call   0x8048550 <fgets@plt>
0x080488ec <+115>:   movl   $0x8048ad4,(%esp)
0x080488f3 <+122>:   call   0x8048590 <puts@plt>
0x080488f8 <+127>:   movl   $0x8048b1c,(%esp)
0x080488ff <+134>:   call   0x8048590 <puts@plt>
0x08048904 <+139>:   movl   $0x8048ad4,(%esp)
0x0804890b <+146>:   call   0x8048590 <puts@plt>
0x08048910 <+151>:   mov    $0x8048b40,%eax
0x08048915 <+156>:   mov    %eax,(%esp)
0x08048918 <+159>:   call   0x8048510 <printf@plt>
0x0804891d <+164>:   mov    $0x8048a60,%eax
0x08048922 <+169>:   lea    0x28(%esp),%edx
0x08048926 <+173>:   mov    %edx,0x4(%esp)
0x0804892a <+177>:   mov    %eax,(%esp)
0x0804892d <+180>:   call   0x80485e0 <__isoc99_scanf@plt>
0x08048932 <+185>:   mov    0x28(%esp),%eax
0x08048936 <+189>:   mov    %eax,0x4(%esp)
0x0804893a <+193>:   lea    0x2c(%esp),%eax
0x0804893e <+197>:   mov    %eax,(%esp)
0x08048941 <+200>:   call   0x8048748 <auth>
0x08048946 <+205>:   test   %eax,%eax
0x08048948 <+207>:   jne    0x8048969 <main+240>
0x0804894a <+209>:   movl   $0x8048b52,(%esp)
0x08048951 <+216>:   call   0x8048590 <puts@plt>
0x08048956 <+221>:   movl   $0x8048b61,(%esp)
0x0804895d <+228>:   call   0x80485a0 <system@plt>
0x08048962 <+233>:   mov    $0x0,%eax
0x08048967 <+238>:   jmp    0x804896e <main+245>
0x08048969 <+240>:   mov    $0x1,%eax
0x0804896e <+245>:   mov    0x4c(%esp),%edx
0x08048972 <+249>:   xor    %gs:0x14,%edx
0x08048979 <+256>:   je     0x8048980 <main+263>
0x0804897b <+258>:   call   0x8048580 <__stack_chk_fail@plt>
0x08048980 <+263>:   leave  
0x08048981 <+264>:   ret