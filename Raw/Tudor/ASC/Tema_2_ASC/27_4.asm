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
    ;(100+a+b*c)-5/(a-100)5+e-500+x/a-19; a,b-byte; c-word; e-doubleword; x-qword
        a db 105
        b db 3
        c dw -70
        e dd -500
        x dq -2000
; our code starts here
segment code use32 class=code
    start:
        ; ...
        mov ax,0
        mov al,[a]
        cbw
        add ax,100
        mov cx,ax
        mov ax,0
        mov al,[b]
        cbw
        mov bx,ax
        mov ax,cx
        mov cx,0
        mov cx,ax;cx=100+a
        mov ax,0
        mov ax,bx;ax=b
        mov bx,0
        imul word[c];dx:ax=b*c
        add ax,cx
        adc dx,0;dx:ax=(100+a+b*c)
        mov cx,ax;cx=ax
        mov ax,0
        mov al,[a]
        cbw
        sbb ax,100;ax=a-100
        push ax
        mov ax,cx
        pop cx;swap(cx,ax), cx=a-100
        idiv cx;ax=(dx:ax)/cx
        mov dx,0
        cwde;ax=eax
        add eax,[e];eax=(100+a+b*c)/(a-100)+e
        mov ebx,eax
        mov edx,0
        mov edx,dword[x+4]
        mov al,[a]
        cbw
        cwde
        mov ecx,eax;ecx=a
        mov eax,0
        mov eax,dword[x];edx:eax=x
        idiv ecx ;eax=x/a
        mov edx,0
        add ebx,eax
        mov eax,ebx;eax=(100+a+b*c)-5/(a-100)5+e-500+x/a-19
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
