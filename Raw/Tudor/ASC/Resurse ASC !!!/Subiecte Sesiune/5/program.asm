bits 32 ;asamblare si compilare pentru arhitectura de 32 biti

global  start 

; declararea functiilor externe folosite de program
extern exit, printf, scanf
import printf msvcrt.dll
import scanf msvcrt.dll
import exit msvcrt.dll    

segment  data use32 class=data
    mesaj db "%c = ", 0
    n resd 1
    x resd 1
    format db "%d", 0
    sir_dword dd 0
    sir_bytes db 0
    suma db 0
      
   
segment  code use32 class=code ; segmentul de cod
    start:   
        ; se apeleaza functia printf(mesaj, 'n')
        ; se pun parametrii pe stiva
        push dword 'n'
        push dword mesaj
        call [printf]
        add esp, 4*2 ; eliberarea parametrilor de pe stiva
        
        ; se apeleaza functia scanf(format, n)
        ; se pun parametrii pe stiva
        push dword n
        push dword format
        call [scanf]
        add esp, 4*2 ; eliberarea parametrilor de pe stiva
        
        ; se pregateste sirul pentru adaugarea dwordurilor citite
        cld
        mov edi, sir_dword
        mov ecx, dword [n]
        jecxz final
        
        citire_dworduri:
            push ecx
            
            ; se apeleaza functia printf(mesaj, 'x')
            ; se pun parametrii pe stiva
            push dword 'x'
            push dword mesaj
            call [printf]
            add esp, 4*2 ; eliberarea parametrilor de pe stiva
            
            ; se apeleaza functia scanf(format, x)
            ; se pun parametrii pe stiva
            push dword x
            push dword format
            call [scanf]
            add esp, 4*2 ; eliberarea parametrilor de pe stiva
            
            ; se salveaza dwordul citit in sirul s 
            mov eax, [x]
            stosd
            
            pop ecx
            
        loop citire_dworduri
        
        ; se pune 0 in fiecare registru
        xor eax, eax
        xor ebx, ebx
        xor ecx, ecx
        xor edx, edx
        
        ; se pregatesc cele doua siruri pentru prelucrare
        cld
        mov esi, sir_dword
        mov edi, sir_bytes
        mov ecx, [n]
        jecxz final
        
        construire_sir_bytes:
            lodsd   ; in EAX avem dwordul din sirul sir_dword
            mov [suma], byte 0
            
            cmp eax, 0
            je adaugare
            
            calculare_suma:
                mov edx, 0
                mov ebx, 10
                div ebx
                
                ; in EAX avem catul, in EDX restul
                ; restul = ultima cifra din EAX
                ; se verifica daca EDX e par
                
                test dl, 1
                jnz sari
                add [suma], dl
                
                sari:
                    cmp eax, 0
                    jne calculare_suma
                
            adaugare:
                mov al, byte [suma]
                stosb
                
            nu_verifica:
            
        loop construire_sir_bytes
            
    final:
        push dword 0
        call [exit]