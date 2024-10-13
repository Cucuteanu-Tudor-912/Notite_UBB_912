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

; (c-a-d)+(c-b)-a (fara semn) = (10-5-12)+(10-2)-5 = -7+8-5 = -4

start:
    mov eax, [c] ; EAX = 10
    
    mov bl, [a] ; mutam a in BL si il extindem
    mov bh, 0  
    
    mov edx, 0
    mov dx, bx
    mov ebx, edx

    sub eax, ebx ; EAX = c-a
    
    mov ebx, 0
    mov ebx, [d]
    mov edx, [d+4] ; il punem pe d in EDX:EBX
    
    sub eax, ebx ; EAX = c-a-d
    sbb edx, 0
    
    
    mov ecx, [c] ; il punem pe c in ECX
    
    mov ebx, 0 ; golim registrul
    mov bx, [b] 
    mov edx, 0 ; il convertim pe word[b] la doubleword
    mov dx, bx
    mov ebx, edx; b este acum double word
    
    sub ecx,ebx ; ECX = c-b
    mov edx, 0 ; se sterge ce era in edx
    
    add eax, ecx ; EAX = (c-a-d)+(c-b)
    
    ;se converteste byte[a] la quadword
    mov ebx, 0
    mov ecx, 0
    mov bl, [a]
    
    sub eax, ebx ; EAX = (c-a-d)+(c-b)-a
    sbb edx, 0 ; rezultatul e in eax
    
   
  
push    dword 0      ; push the parameter for exit onto the stack
call    [exit]       ; call exit to terminate the program  
    
    
    
    