section .data
    msg db 'Hello World!', 0xa
    tam equ $- msg

section .text

global _start

_start:
    mov     eax, 0x4 ; sys_write
    mov     ebx, 0x1 ; stdout
    mov     ecx, msg
    mov     edx, tam
    int     0x80

saida:
    mov     eax, 0x1
    mov     ebx, 0x0
    int     0x80
