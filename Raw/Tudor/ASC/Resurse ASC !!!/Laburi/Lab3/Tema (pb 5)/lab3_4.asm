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

; (a+b/c-1)/(b+2)-x (fara semn) = (5+10/2-1)/(10+2)-12 = 9/12 - 12 = -12

start:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    
    ;pentru a calcula b/c, convertim b de la byte la doubleword pentru a-l putea imparti la word-ul c
	mov al, [b]
	mov ah, 0 ;conversie fara semn de la al la ax
	mov dx, 0 ;conversie fara semn de la ax la dx:ax
	;dx:ax = b
	div word [c] ;impartire fara semn dx:ax la c
	;ax=b/c
    
    mov ebx, [a]
	add ebx, eax ; ebx = a+b/c
    
    sub ebx, 1 ; ebx = a+b/c-1
    mov eax, ebx
    
    mov cl, [b]
    add cl, byte 2 ; cl = b+2
    
    div ecx ; rezultatul e in eax
    
    mov ebx, [x]
    mov edx, [x+4]
    
    xor ecx, ecx
    
    sub eax, ebx ; rezultatul e in eax
    sbb edx, 0
    
    
    
push    dword 0      ; push the parameter for exit onto the stack
call    [exit]       ; call exit to terminate the program 