bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    d dw 20
    a db 5
    b db 6
    c db 3
; 30-13=17/3
; our code starts here
segment code use32 class=code
    start:
        ; ...
    mov AX,0
    mov BX,0
    mov AX, [d]
    add AX, 10        
    mov BX, AX
    mov AX, 0
    mov AL, [a]
    mul AL
    mov CX,AX
    mov AX,0
    mov AL,2
    mul byte[b]
    SUB CX,AX
    SUB BX,CX
    mov AX,0
    mov CX,0
    mov AX, BX
    mov CL,[c]
    div CL
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
