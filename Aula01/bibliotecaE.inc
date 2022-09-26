segment .data
    LF          equ 0xa ; line feed (10)
    NULL        equ 0xd ; final de string (13)
    SYS_EXIT    equ 0x1 ; código da chamada para finalizar
    RET_EXIT    equ 0x0 ; operação com sucesso
    STD_IN      equ 0x0 ; entrada padrão
    STD_OUT     equ 0x1 ; saída padrão
    SYS_READ    equ 0x3 ; operação de leitura
    SYS_WRITE   equ 0x4 ; operação de escrita
    SYS_CALL    equ 0x80 ; envia informação para o SO
    TAM_BUFFER  equ 0x4

segment .base
    TAM_BUFFER  resb 0x1

    ; parei na página 18
