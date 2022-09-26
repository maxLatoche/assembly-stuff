section .text
global sum_to_n
sum_to_n:
    push    rbp
    mov     rbp, rsp
    mov     [rbp-4], edi    ; add argument to stack frame
    mov     byte[rbp-8], 0x0    ; assign 0 to total
    mov     byte[rbp-12], 0x0    ; assign 0 to i
    jmp     loop

loop:
    mov     eax, -0xc    ; move i to eax reg
    cmp     eax, -0x4    ; compare n to i
    jle     increment
    ret

increment:
    add     [rbp-8], eax    ; add i to total
    add     eax, 0x1          ; add 1 to i

_main:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 0x10
    mov     edi, 0x3
    call    sum_to_n
    pop     rbp
	ret

