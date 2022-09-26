section .text
global sum_to_n
sum_to_n:
    push    %rbp                ;
    mov     %rbp, %rsp
    mov     -0x4(%rbp), %edi    ; add argument to stack frame
    mov     -0x8(%rbp), $0x0    ; assign 0 to total
    mov     -0xc(%rbp), $0x0    ; assign 0 to i
    jmp     loop

loop:
    mov     %eax, -0xc(%rbp)    ; move i to eax reg
    cmp     %eax, -0x4(%rbp)    ; compare n to i
    jlte    increment


increment:
    add     -0x8(%rbp), %eax    ; add i to total
    add     %eax, $0x1          ; add 1 to i


_main:
    push    %rbp
    mov     %rbp, %rsp
    sub     %rsp, $0x10
    mov     %edi, $0x3
    call    sum_to_n
    pop     %rbp
	ret

