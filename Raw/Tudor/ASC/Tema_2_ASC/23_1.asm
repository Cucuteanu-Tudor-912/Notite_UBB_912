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
    ;((a+a)+(b+b)+(c+c))-d
    a db 5
    b dw 300
    c dd 5000
    d dq 5000
; our code starts here
segment code use32 class=code
    start:
        ; ...
        mov AL,byte[a]
        add AL, byte[a]
        mov AH,0
        mov BX,word[b]
        add BX,word[b]
        add AX,BX ;AX=(a+a)+(b+b)
        mov BX,0
        push BX
        push AX
        pop EAX
        mov ECX,dword[c]
        add ECX,dword[c]
        add EAX,ECX
        mov EDX,0
        sub EAX, dword[d]
        sbb EDX, dword[d+4]
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
