bits 32 ; asamblare și compilare pentru arhitectura de 32 biți
; definim punctul de intrare in programul principal
global start

; declaram functiile externe necesare programului nostru
extern exit ; indicam asamblorului ca exit exista, chiar daca nu o vom defini 
import exit msvcrt.dll ; exit este o functie care incheie procesul, este definita in msvcrt.dll
        ; msvcrt.dll contine exit, printf si toate celelalte functii C-runtime importante
        
segment  data use32 class=data ; segmentul de date in care se vor defini variabilele 

a dw 10
b dw 1
c dw 1
d dw 5

; segmentul de cod
segment  code use32 class=code ; 
; (c+b+b)-(c+a+d)

start:
mov ax, [c]
add ax, [b]
add ax, [b]

mov bx, [c]
add bx, [a]
add bx, [d]

sub ax, bx

push dword 0 ;se pune pe stiva codul de retur al functiei exit
call [exit] ;apelul functiei sistem exit pentru terminarea executiei programului