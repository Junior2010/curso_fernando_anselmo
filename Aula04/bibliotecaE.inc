segment .data
    LF          equ 0xa ; line feef
    NULL        equ 0xd ; final da String
    SYS_CALL    equ 0x80 ; envia informação ao SO
    ;EAX
    SYS_EXIT    equ 0x1 ; código para finalizar o programa
    SYS_READ    equ 0x3 ; operação de leitura
    SYS_WRITE   equ 0x4 ; operação de escrita
    ; EBX
    RET_EXIT    equ 0x0 ; operação realizada com sucesso
    STD_IN      equ 0x0 ; entrada padrão
    STD_OUT     equ 0x1 ; saída padrão
    TAM_BUFFER  equ 0xa ; tamanho BUFFER

segment .bss
    BUFFER      resb 0x1

segment .text

saidaResultado:
    mov eax,    0x4
    mov ebx,    0x1
    mov ecx,    BUFFER
    mov edx,    TAM_BUFFER
    int 0x80
    ret