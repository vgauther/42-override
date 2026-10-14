0x00000000000009cd <+0>:     push   %rbp
0x00000000000009ce <+1>:     mov    %rsp,%rbp
0x00000000000009d1 <+4>:     sub    $0xa0,%rsp
0x00000000000009d8 <+11>:    mov    %rdi,-0x98(%rbp)
0x00000000000009df <+18>:    lea    -0x90(%rbp),%rax
0x00000000000009e6 <+25>:    mov    %rax,%rsi
0x00000000000009e9 <+28>:    mov    $0x0,%eax
0x00000000000009ee <+33>:    mov    $0x10,%edx
0x00000000000009f3 <+38>:    mov    %rsi,%rdi
0x00000000000009f6 <+41>:    mov    %rdx,%rcx
0x00000000000009f9 <+44>:    rep stos %rax,%es:(%rdi)
0x00000000000009fc <+47>:    lea    0x1e1(%rip),%rdi        # 0xbe4
0x0000000000000a03 <+54>:    callq  0x730 <puts@plt>
0x0000000000000a08 <+59>:    lea    0x1d0(%rip),%rax        # 0xbdf
0x0000000000000a0f <+66>:    mov    %rax,%rdi
0x0000000000000a12 <+69>:    mov    $0x0,%eax
0x0000000000000a17 <+74>:    callq  0x750 <printf@plt>
0x0000000000000a1c <+79>:    mov    0x201595(%rip),%rax        # 0x201fb8
0x0000000000000a23 <+86>:    mov    (%rax),%rax
0x0000000000000a26 <+89>:    mov    %rax,%rdx
0x0000000000000a29 <+92>:    lea    -0x90(%rbp),%rax
0x0000000000000a30 <+99>:    mov    $0x80,%esi
0x0000000000000a35 <+104>:   mov    %rax,%rdi
0x0000000000000a38 <+107>:   callq  0x770 <fgets@plt>
0x0000000000000a3d <+112>:   movl   $0x0,-0x4(%rbp)
0x0000000000000a44 <+119>:   jmp    0xa6a <set_username+157>
0x0000000000000a46 <+121>:   mov    -0x4(%rbp),%eax
0x0000000000000a49 <+124>:   cltq   
0x0000000000000a4b <+126>:   movzbl -0x90(%rbp,%rax,1),%ecx
0x0000000000000a53 <+134>:   mov    -0x98(%rbp),%rdx
0x0000000000000a5a <+141>:   mov    -0x4(%rbp),%eax
0x0000000000000a5d <+144>:   cltq   
0x0000000000000a5f <+146>:   mov    %cl,0x8c(%rdx,%rax,1)
0x0000000000000a66 <+153>:   addl   $0x1,-0x4(%rbp)
0x0000000000000a6a <+157>:   cmpl   $0x28,-0x4(%rbp)
0x0000000000000a6e <+161>:   jg     0xa81 <set_username+180>
0x0000000000000a70 <+163>:   mov    -0x4(%rbp),%eax
0x0000000000000a73 <+166>:   cltq   
0x0000000000000a75 <+168>:   movzbl -0x90(%rbp,%rax,1),%eax
0x0000000000000a7d <+176>:   test   %al,%al
0x0000000000000a7f <+178>:   jne    0xa46 <set_username+121>
0x0000000000000a81 <+180>:   mov    -0x98(%rbp),%rax
0x0000000000000a88 <+187>:   lea    0x8c(%rax),%rdx
0x0000000000000a8f <+194>:   lea    0x165(%rip),%rax        # 0xbfb
0x0000000000000a96 <+201>:   mov    %rdx,%rsi
0x0000000000000a99 <+204>:   mov    %rax,%rdi
0x0000000000000a9c <+207>:   mov    $0x0,%eax
0x0000000000000aa1 <+212>:   callq  0x750 <printf@plt>
0x0000000000000aa6 <+217>:   leaveq 
0x0000000000000aa7 <+218>:   retq