; Scrieți un program în limbaj de asamblare care să rezolve expresia aritmetică, considerând domeniile de definiție ale variabilelor
; a - byte
; b - word
; c - double word
; d - qword

bits 32 ;asamblare si compilare pentru arhitectura de 32 biti

; definim punctul de intrare in programul principal
global  start 

extern  exit ; indicam asamblorului ca exit exista, chiar daca noi nu o vom defini
import  exit msvcrt.dll; exit este o functie care incheie procesul, este definita in msvcrt.dll
        ; msvcrt.dll contine exit, printf si toate celelalte functii C-runtime importante
segment  data use32 class=data ; segmentul de date in care se vor defini variabilele 
	a db 5
	b dw 2
	c dd 10
	d dq 12
segment  code use32 class=code ; segmentul de cod

; (c+b+b)-(c+d+a) (cu semn) = (10+2+2)-(10+12+5) = 14-27 = -13

start:
    mov ax, [b] ; ax = b
    add ax, [b] ; ax = b+b
    cwde ; EAX = b+b
    add eax, [c] ; eax = c+b+b
    
    cdq ; edx:eax = c+b+b
    
    mov ebx, eax
    mov ecx, edx
    
    mov al, [a] ; al = a
    cbw ; ax = a
    add ax, [c] ; ax = c+a
    cwde ; eax = c+a
    cdq ; edx:eax = c+a
    
    add eax, dword[d] ; eax = c+a+d
    adc edx, dword[d+4] 
    
    sub ebx, eax
    sbb edx, 0
    

push    dword 0      ; push the parameter for exit onto the stack
call    [exit]       ; call exit to terminate the program  