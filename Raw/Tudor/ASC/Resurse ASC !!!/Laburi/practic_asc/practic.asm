; Sa se citeasca de la tastatura mai multe numere pana la citirea valorii 0. Sa se scrie intr-un fisier, separate de spatii, doar acele numere negative care au numar impar de biti 0 (cu valoarea 0).


bits 32

global start

extern  exit, printf, scanf, fprintf, fopen, fclose
import  exit msvcrt.dll
import printf msvcrt.dll
import scanf msvcrt.dll
import fopen msvcrt.dll
import fclose msvcrt.dll
import fprintf msvcrt.dll

segment  data use32 class=data
    x resd 1
    mesaj_citire db "x = ", 0
    format db "%d", 0
    nume_fisier db "practic.txt", 0
    mod_acces db "a", 0
    descriptor dd -1
    
    biti_zero dw 0
    
segment  code use32 class=code 
start:
    ; se deschide fisierul in care vom scrie numerele
    ; eax = fopen(nume_fisier, mod_acces)
    push dword mod_acces     
    push dword nume_fisier
    call [fopen]
    add esp, 4*2 
    
    ; verificam daca eax != 0
    cmp eax, 0
    je final
    
    ; daca nu a exitat nici o eroare, mutam valoarea din eax in variabila descriptor
    mov [descriptor], eax 

    citire:
        ; se apeleaza functia printf(mesaj_citire) pentru a se afisa "x = "
        push dword mesaj_citire
        call [printf]
        add esp, 4*1
        
        ; se apeleaza functia scanf(format, x)
        push dword x
        push dword format
        call [scanf]
        add esp, 4*2
        
        ; se pune 0 in fiecare registru
        mov eax, 0
        mov ebx, 0
        mov ecx, 0
        mov edx, 0
        
        mov ebx, [x]
        ; se verifica daca numarul citit este 0
        cmp ebx, 0
        je final
        
        ; se verifica daca numarul este negativ
        cmp ebx, 0
        jae citire
        
        ; daca este negativ, se numara bitii egali cu 0
        ; se "roteste" numarul la dreapta pana acesta este egal cu 0
        parcurgere:
            shr ebx, 1
            jnc adunare ; daca cf = 0
            
            cmp ebx, 0
            je salvare_numar
            jmp parcurgere
            
            adunare:
                add word [biti_zero], 1
                jmp parcurgere
        
        salvare_numar:
            ; se verifica paritatea lui biti_zero
              mov ax, word [biti_zero]
              div byte [2]
              
              cmp ah, 0
              jne citire
              
              mov word[biti_zero], 0
              
            ; se apeleaza functia fprintf
            ; fprintf(descriptor, format, x)
            push dword [x]
            push dword format
            push dword [descriptor]
            call [fprintf]
            add esp, 4*3
            jmp citire

final:
    ; se inchide fisierul
    push dword [descriptor]
    call [fclose]
    add esp, 4
    
    push dword 0
    call [exit]
    