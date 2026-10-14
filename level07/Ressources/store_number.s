0x08048630 <+0>:     push   %ebp
0x08048631 <+1>:     mov    %esp,%ebp
0x08048633 <+3>:     sub    $0x28,%esp
0x08048636 <+6>:     movl   $0x0,-0x10(%ebp)
0x0804863d <+13>:    movl   $0x0,-0xc(%ebp)
0x08048644 <+20>:    mov    $0x8048ad3,%eax
0x08048649 <+25>:    mov    %eax,(%esp)
0x0804864c <+28>:    call   0x8048470 <printf@plt>
0x08048651 <+33>:    call   0x80485e7 <get_unum>
0x08048656 <+38>:    mov    %eax,-0x10(%ebp)
0x08048659 <+41>:    mov    $0x8048add,%eax
0x0804865e <+46>:    mov    %eax,(%esp)
0x08048661 <+49>:    call   0x8048470 <printf@plt>
0x08048666 <+54>:    call   0x80485e7 <get_unum>
0x0804866b <+59>:    mov    %eax,-0xc(%ebp)
0x0804866e <+62>:    mov    -0xc(%ebp),%ecx
0x08048671 <+65>:    mov    $0xaaaaaaab,%edx
0x08048676 <+70>:    mov    %ecx,%eax
0x08048678 <+72>:    mul    %edx
0x0804867a <+74>:    shr    %edx
0x0804867c <+76>:    mov    %edx,%eax
0x0804867e <+78>:    add    %eax,%eax
0x08048680 <+80>:    add    %edx,%eax
0x08048682 <+82>:    mov    %ecx,%edx
0x08048684 <+84>:    sub    %eax,%edx
0x08048686 <+86>:    test   %edx,%edx
0x08048688 <+88>:    je     0x8048697 <store_number+103>
0x0804868a <+90>:    mov    -0x10(%ebp),%eax
0x0804868d <+93>:    shr    $0x18,%eax
0x08048690 <+96>:    cmp    $0xb7,%eax
0x08048695 <+101>:   jne    0x80486c2 <store_number+146>
0x08048697 <+103>:   movl   $0x8048ae6,(%esp)
0x0804869e <+110>:   call   0x80484c0 <puts@plt>
0x080486a3 <+115>:   movl   $0x8048af8,(%esp)
0x080486aa <+122>:   call   0x80484c0 <puts@plt>
0x080486af <+127>:   movl   $0x8048ae6,(%esp)
0x080486b6 <+134>:   call   0x80484c0 <puts@plt>
0x080486bb <+139>:   mov    $0x1,%eax
0x080486c0 <+144>:   jmp    0x80486d5 <store_number+165>
0x080486c2 <+146>:   mov    -0xc(%ebp),%eax
0x080486c5 <+149>:   shl    $0x2,%eax
0x080486c8 <+152>:   add    0x8(%ebp),%eax
0x080486cb <+155>:   mov    -0x10(%ebp),%edx
0x080486ce <+158>:   mov    %edx,(%eax)
0x080486d0 <+160>:   mov    $0x0,%eax
0x080486d5 <+165>:   leave  
0x080486d6 <+166>:   ret