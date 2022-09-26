segment .data
    LF          equ 0xa ; line feef
    NULL        equ 0xd ; final da String
    SYS_CALL    equ 0x80 ; envia informaçãp ao SO
    ;EAX
    SYS_EXIT    equ 0x1 ; código para finalizar o programa
    SYS_READ    equ 0x3 ; operação de leitura
    SYS_WRITE   equ 0x4 ; operação de escrita
    ; EBX
    RET_EXIT    equ 0x0 ; operação realizada com sucesso
    STD_IN      equ 0x0 ; entrada padrão
    STD_OUT     equ 0x1 ; saída padrão

section .data
    msg db "Entre com seu nome:", LF, NULL
    tam equ $- msg

section .bss
    nome:   resb 1

section .text
    global _start

_start:
    mov     eax, 0x4    ; SYS_WRITE
    mov     ebx, 0x1    ; STD_OUT
    mov     ecx, msg
    mov     edx, tam
    int     0x80        ; SYS_CALL

    mov     eax, 0x3    ; SYS_READ
    mov     ebx, 0x0    ; STD_IN
    mov     ecx, nome
    mov     edx, 0xA    ; quantidade a ser capturada
    int     0x80       ; SYS_CALL

    mov     eax, 0x1    ; SYS_EXIT
    mov     ebx, 0x0    ; RET_EXIT
    int     0x80        ; SYS_CALL