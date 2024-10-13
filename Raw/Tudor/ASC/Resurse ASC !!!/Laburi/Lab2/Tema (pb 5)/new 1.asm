bits 32 ; asamblare și compilare pentru arhitectura de 32 biți
; definim punctul de intrare in programul principal
global start

; declaram functiile externe necesare programului nostru
extern exit ; indicam asamblorului ca exit exista, chiar daca nu o vom defini 
import exit msvcrt.dll ; exit este o functie care incheie procesul, este definita in msvcrt.dll
        ; msvcrt.dll contine exit, printf si toate celelalte functii C-runtime importante
        
segment  data use32 class=data ; segmentul de date in care se vor defini variabilele 

; segmentul de cod
segment  code use32 class=code ; 

; Efectuați calculele și analizați rezultatele: 10/4
start: 
MOV AX, 10
MOV DX, 0
mov BX,4
DIV BX
push dword 0 ;se pune pe stiva codul de retur al functiei exit
call [exit] ;apelul functiei sistem exit pentru terminarea executiei programului