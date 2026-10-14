0x000000000000088c <+0>:     push   %rbp
0x000000000000088d <+1>:     mov    %rsp,%rbp
0x0000000000000890 <+4>:     add    $0xffffffffffffff80,%rsp
0x0000000000000894 <+8>:     mov    0x20171d(%rip),%rax        # 0x201fb8
0x000000000000089b <+15>:    mov    (%rax),%rax
0x000000000000089e <+18>:    mov    %rax,%rdx
0x00000000000008a1 <+21>:    lea    -0x80(%rbp),%rax
0x00000000000008a5 <+25>:    mov    $0x80,%esi
0x00000000000008aa <+30>:    mov    %rax,%rdi
0x00000000000008ad <+33>:    callq  0x770 <fgets@plt>
0x00000000000008b2 <+38>:    lea    -0x80(%rbp),%rax
0x00000000000008b6 <+42>:    mov    %rax,%rdi
0x00000000000008b9 <+45>:    callq  0x740 <system@plt>
0x00000000000008be <+50>:    leaveq 
0x00000000000008bf <+51>:    retq