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
    x: dd 50
    y: dd 10
    msg1: db 'x maior que y', 0xa, 0xd
    tam1: equ $ - msg1
    msg2: db 'y maior que x', 0xa, 0xd
    tam2: equ $ - msg2

section .text
    global _start

_start:
    mov     eax, DWORD[x]
    mov     ebx, DWORD[y]
    ; if
    cmp     eax, ebx
    jge     maior
    ; falhou o teste
    mov     ecx, msg2
    mov     edx, tam2

    ; salto incondicional
    jmp     final
maior:
    mov     ecx, msg1
    mov     edx, tam2

final:
    mov     eax, 0x4
    mov     ebx, 0x1
    int     0x80

    mov     eax, 0x1
    xor     ebx, ebx    ; mov     ebx, 0x0
    ; XOR faz um exclusive or com dois valores
    ; e armazena o resultado no destino. Como
    ; ebx está sendo comparado com ele mesmo o
    ; resultado será 0 e esse 0 será armazenado
    ; em ebx. Portanto isso é o equivalente a mov ebx, 0x0
    int     0x80
