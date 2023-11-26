segment .data
SYS_CALL  equ  0x80
LF        equ  0xA
NULL      equ  0xD
;EAX
SYS_WRITE equ  0x4
SYS_READ  equ  0x3
SYS_EXIT  equ  0x1
;EBX    
STD_OUT   equ  0x1
STD_INPUT equ  0x0
RETURN_OUT equ 0x0

section .data
msg1 db "Informe seu nome:", LF, NULL
tam1 equ  $ - msg1
msg2 db  "Seu nome é:", LF, NULL
tam2 equ $ - msg2

section .bss
nome resb 1

section .text

global _start

_start:
;SYS escreva na tela a msg1
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    mov ECX, msg1
    mov EDX, tam1
    int SYS_CALL

;SYS receba uma entrada
    mov EAX, SYS_READ
    mov EBX, STD_INPUT
    mov ECX, nome
    mov EDX, 0x5
    int SYS_CALL

;SYS escreva na tela a ms2
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    mov ECX, msg2
    mov EDX, tam2
    int SYS_CALL

;SYS escreva o nome que voce recebeu na tela
    mov byte [nome + 5], LF
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    mov ECX, nome
    mov EDX, 0x6
    int SYS_CALL

;SYS encerre o programa
    mov EAX, SYS_EXIT
    mov EBX, RETURN_OUT
    int SYS_CALL

