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
    ;(a + b - c)-690 + (a + b + d)4690 - (a + b)310
    a db 10
    b dw 300
    c dd 1000
    d dq -5000
; our code starts here
segment code use32 class=code
    start:
        ; ...
        mov AL,byte[a]
        cbw
        add AX,word[b]
        cwde
        sbb EAX,dword[c]
        push EAX
        pop EBX
        mov EAX,0
        mov AL,byte[a]
        cbw
        add AX,word[b]
        cwde
        cdq
        add EAX,dword[d]
        adc EDX,dword[d+4]
        add EAX,EBX
        adc EDX,0
        mov EBX,EAX
        mov EAX,0
        mov AL,byte[a]
        cbw
        add AX,word[b]
        cwd
        sbb EBX,EAX
        mov EAX,EBX
        
        
        
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
