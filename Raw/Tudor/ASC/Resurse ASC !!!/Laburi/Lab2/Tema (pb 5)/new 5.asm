bits 32 ; asamblare și compilare pentru arhitectura de 32 biți
; definim punctul de intrare in programul principal
global start

; declaram functiile externe necesare programului nostru
extern exit ; indicam asamblorului ca exit exista, chiar daca nu o vom defini 
import exit msvcrt.dll ; exit este o functie care incheie procesul, este definita in msvcrt.dll
        ; msvcrt.dll contine exit, printf si toate celelalte functii C-runtime importante
        
segment  data use32 class=data ; segmentul de date in care se vor defini variabilele 

a db 5
b db 2
c db 4
d dw 3

; segmentul de cod
segment  code use32 class=code ; 
; [d-2*(a-b)+b*c]/2

start:

mov ah, [a]
sub ah, [b]

mov al, 2
mul ah ; rezultatul este in ax

mov bx, [d]
sub bx, ax ; rezultatul este in bx

mov ax, 0 ; se goleste ax pentru a fi refolosit
mov ah, [b]
mov al, [c]
mul ah ; rezultatul este in ax

add ax, bx ; rezultatul este in ax

mov dx, 0
mov bx, 2
div bx

push   dword 0 ;se pune pe stiva codul de retur al functiei exit
call   [exit] ;apelul functiei sistem exit pentru terminarea executiei programului
