; Scrieți un program în limbaj de asamblare care să rezolve expresia aritmetică, considerând domeniile de definiție ale variabilelor
; a - doubleword
; b - byte
; c - word
; x - qword

bits 32 ;asamblare si compilare pentru arhitectura de 32 biti

; definim punctul de intrare in programul principal
global  start 

extern  exit ; indicam asamblorului ca exit exista, chiar daca noi nu o vom defini
import  exit msvcrt.dll; exit este o functie care incheie procesul, este definita in msvcrt.dll
        ; msvcrt.dll contine exit, printf si toate celelalte functii C-runtime importante
segment  data use32 class=data ; segmentul de date in care se vor defini variabilele 
	a dd 5
	b db 10
	c dw 2
	x dq 12
segment  code use32 class=code ; segmentul de cod

; (a+b/c-1)/(b+2)-x (cu semn) = (5+10/2-1)/(10+2)-12 = 9/12 - 12 = -12

start:
    ;pentru a calcula b/c, convertim b de la byte la doubleword pentru a-l putea imparti la word-ul c
    
	mov al, [b]
	cbw ;conversie cu semn de la al la ax
	cwd ;conversie cu semn de la ax la dx:ax
	;dx:ax = b
	idiv word [c] ;impartire cu semn dx:ax la c
	;ax=b/c	
    
    cwde ; eax = b/c
    add eax, [a] ; eax = a+b/c
    
    sub eax, 1 ; eax = a+b/c-1
    
    mov cl, [b]
    add cl, 2
    cbw ; cx = b+2
    
    ;se sparge eax in dx:ax pentru impartire
    
    push eax
    pop ax
    pop dx
    
    idiv cx ; ax = (a+b/c-1)/(b+2)
    cwde ; eax = ax
    cdq
    sub eax, [x] ; rezultatul e in eax
    sbb edx, 0
    

push    dword 0      ; push the parameter for exit onto the stack
call    [exit]       ; call exit to terminate the program 