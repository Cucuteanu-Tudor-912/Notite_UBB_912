
bits 32

global start        

extern exit,printf
import exit msvcrt.dll
import printf msvcrt.dll

segment data use32 class=data

    sir dd 1234A678h, 12785634h, 1A4D3C28h
    len equ $-sir
    noul_cuvant times len db 0
    format_print db "%d", 0
    
segment code use32 class=code
    start:
        ; se pune 0 in fiecare registru
        mov eax, 0
        mov ebx, 0
        mov ecx, 0
        mov edx, 0
        
        ; in edi se pune adresa sirului in care vom incarca octetii
        cld
        mov esi, sir
        mov edi, noul_cuvant
        mov ecx, len/4
        
        formare_cuvant:
            lodsw               ; in AX avem wordul low
            shr ax, 8           ; shiftam cu 8 pozitii pentru a avea in bitul high din AH
            stosb
            
            lodsw               ; in AX avem wordul high
            shr ax, 8           ; shiftam cu 8 pozitii pentru a avea in bitul high din AH
            stosb
            
            push ecx            ; punem ECX pe stiva pentru ca il vom folosi in alt loop
            mov ecx, 16         ; numarul bitilor dintr-un word
            mov ax, [noul_cuvant]
            
            biti_de_1:
                shr ax, 1
                adc edx, 0
            
            loop biti_de_1
            
            pop ecx
        loop formare_cuvant 
        
        push edx
        push dword format_print
        call [printf]
        add esp, 4*2

    final:
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program