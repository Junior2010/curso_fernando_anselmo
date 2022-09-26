; entrada.asm
; programa par entrada de dados
;
segment .data
    LF          equ 0xa ; line feed (10)
    NULL        equ 0xd ; final de string (13)
    SYS_EXIT    equ 0x1 ; código de chamada para finalizar
    RET_EXIT    equ 0x0 ; operação com sucesso
    STD_IN      equ 0x0 ; entrada padrão
    STD_OUT     equ 0x1 ; saída padrão
    SYS_READ    equ 0x3 ; operação de leitura
    SYS_WRITE   equ 0x4 ; operação de escrita
    SYS_CALL    equ 0x80 ; envia einformação ao SO

section .data
    msg     db "Entre com seu nome: ", 0Xa, 0xd
    tam     equ $- msg

section .bss
    nome    resb 1

section .text

global _start

_start:
    mov         eax, SYS_WRITE
    mov         ebx, STD_OUT
    mov         ecx, msg
    mov         edx, tam
    int         SYS_CALL

    mov         eax, SYS_READ
    mov         ebx, STD_IN
    mov         ecx, nome
    mov         edx, 0xa
    int         SYS_CALL

    mov         eax, SYS_EXIT
    mov         ebx, RET_EXIT
    int         SYS_CALL