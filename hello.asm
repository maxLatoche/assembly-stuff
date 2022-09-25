; writes hello world to the console
; nasm -fmacho64 hello.asm && ld -lSystem hello.o && ./a.out

        global  _main
        section .text

_main:  mov     rax, 0x02000004     ; when we call syscall, rax must contain the syscall number (this is start)
        mov     rdi, 1              ; file handle is 1 for stdout, rdi is 'register destination index'
        mov     rsi, msg            ; rsi is 'register source index'
        mov     rdx, 13             ; 19 bytes
        syscall

        mov     rax, 0x02000001     ; when we call syscall, rax must contain the syscall number (this is exit)
        xor     rdi, rdi            ; sets exit status code 0, xor is faster than mov https://stackoverflow.com/questions/33666617/what-is-the-best-way-to-set-a-register-to-zero-in-x86-assembly-xor-mov-or-and
        syscall



        section .data
msg:     db      "Hello, World", 10  ;newline at the end
