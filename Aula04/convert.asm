%include 'bibliotecaE.inc'

section .data
    v1 dw '105', 0xa, 0xd

section .text
    global _start

_start: 

; -------------------------------------
; string para inteiro
; -------------------------------------
; Entrada: ESI (valor conv) ECX (tam)
; Saída  : EAX
; -------------------------------------
string_to_int:
    xor     ebx, ebx
.prox_digito:
    movzx   eax, byte[esi]
    inc     esi
    sub     al, '0'
    imul    ebx, 0xa
    add     ebx, eax    ; ebx = ebx * 10 + eax
    loop .prox_digito   ; while (--ecx)
    mov     eax, ebx
    ret

; -------------------------------------
; inteiro para string
; -------------------------------------
; 
;
; -------------------------------------