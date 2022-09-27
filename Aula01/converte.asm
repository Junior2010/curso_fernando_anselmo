%include 'bibliotecaE.inc'

section .data
    v1 dw '105', 0xa

section .text
    global _start

_start
    call converte_valor
    call mostrar_valor
    mov     eax, SYS_EXIT
    mov     ebx, RET_EXIT
    int     SYS_CALL