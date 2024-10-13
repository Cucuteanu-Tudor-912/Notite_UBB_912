bits 32 ;asamblare si compilare pentru arhitectura de 32 biti

global  start 

; declararea functiilor externe folosite de program
extern exit     
import exit msvcrt.dll    

segment  data use32 class=data
    s1 dq 5678123419122324h, 6465626366676869h, 6262626262626262h
    len equ $-s1
    s2 times len/2 dd 0
   
segment  code use32 class=code ; segmentul de cod
    start:
        ; se pune 0 in fiecare registru
        xor eax, eax
        xor ebx, ebx
        xor ecx, ecx
        xor edx, edx
        
        ; se pregateste sirul s1 de parcurgere
        cld
        mov esi, s1
        mov edi, s2
        mov ecx, len
        
        parcurgere_sir:
            lodsd        ; in EAX avem dwordul low din qword
                         ; nu avem nevoie de el, deoarece lucram doar cu cele doua parti din dwordul HIGH
                         ; pentru 12345678 19122324h, dword high = 12345678h, unde word low = 5678h si word high = 1234h
                         
            lodsw        ; in AX avem acum wordul low
            mov bx, ax   ; salvam wodul low in BX pentru ca vom avea nevoie de el
            lodsw        ; in AX pastram wordul high
            
            ; verificam daca cuvantul high este mai mare decat cuvantul low al dwordului
            cmp ax, bx
            jle nu_verifica
            
            verifica:
                stosw
            
            nu_verifica:
                sub ecx, 8
                jecxz final
                jmp parcurgere_sir
          
            
        final:
            push dword 0
            call [exit]