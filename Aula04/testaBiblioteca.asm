%include 'bibliotecaE.inc'

section .text
    global _start

_start:
    lea     esi, [BUFFER];
    add     esi, 0x9
    mov     byte[esi], 0xa

    dec     esi
    mov     dl, 0x11    ; "A"
    add     dl, '0'     ; se adicionar 0, converte em caractere
                        ; se subtrair 0, converte em número
    mov     [esi], dl

    call    saidaResultado

    mov     eax, 0x1
    mov     ebx, 0x0
    int     0x80