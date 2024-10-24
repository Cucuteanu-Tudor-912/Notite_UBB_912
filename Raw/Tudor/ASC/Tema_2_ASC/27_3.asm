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
    ;(100+a+b*c)265/(a-100)5+e553+x/a638; a,b-byte; c-word; e-doubleword; x-qword
        a db 105
        b db 3
        c dw 20
        e dd 500
        x dq 9000
; our code starts here
segment code use32 class=code
    start:
        ; ...
        mov AL,byte[a]
        mov AH,0
        add AX,100
        push AX
        pop BX ;BX=100+a
        mov AX,0
        mov AL,byte[b]
        mul word[c] ;DX:AX=b*c
        add AX,BX
        adc DX,0 ;DX:AX=(100+a+b*c)
        mov BX,0
        mov BL,byte[a]
        sub BL,100
        mov BH,0
        div BX ;AX=(100+a+b*c)/(a-100)
        mov DX,0
        mov BX,0
        push DX
        push AX
        pop EAX
        add EAX,dword[e]
        mov EBX,EAX
        mov EAX,0
        mov EDX,0
        add EAX,dword[x]
        adc EDX,dword[x+4]
        mov ECX,0
        mov CL,byte[a]
        div ECX
        add EAX,EBX
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
