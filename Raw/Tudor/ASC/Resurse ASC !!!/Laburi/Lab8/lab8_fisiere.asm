; OPERATII CU FISIERE TEXT

;Se da un fisier text. Sa se citeasca continutul fisierului, sa se contorizeze numarul de caractere speciale si sa se afiseze aceasta valoare. ;Numele fisierului text este definit in segmentul de date.

;Valorile vor fi afisate in format decimal (baza 10) cu semn.

bits 32 ; asamblare si compilare pentru arhitectura de 32 biti

global start        

; declararea functiilor externe folosite de program
extern exit,fopen,fprintf,fclose, printf  
import exit msvcrt.dll
import fopen msvcrt.dll
import fprintf msvcrt.dll
import fclose msvcrt.dll
import printf msvcrt.dll

; declararea datelor
segment data use32 class=data
    nume_fisier db "caractere.txt", 0  ; numele fisierului care va fi creat
    mod_acces db "w", 0                ; modul de deschidere a fisierului - 
                                       ; w - pentru scriere. daca fiserul nu exista, se va crea 
    descriptor_fisier dd -1            ; variabila in care vom salva descriptorul fisierului - necesar pentru a putea face referire la fisier
    
    text db "aA@#G,7", 0               ; declararea unui sir de caractere care contine caractere speciale
    len_text equ $-text-1              ; lungimea sirului de caractere
    
    contor_message db "Numarul de caractere speciale = %d", 0 ; mesajul care se va afisa
    
; our code starts here
segment code use32 class=code
    start:
    
        ; se pune 0 in fiecare registru
        mov eax, 0
        mov ebx, 0
        mov ecx, 0
        mov edx, 0
        
        ; se apeleaza functia fopen pentru a crea fisierul
        ; functia va returna in EAX descriptorul fisierului sau 0 in caz de eroare
        ; eax = fopen(nume_fisier, mod_acces)
        
        push dword mod_acces     
        push dword nume_fisier
        call [fopen]
        add esp, 4*2                ; eliberam parametrii de pe stiva
        
        mov [descriptor_fisier], eax; salvam valoarea returnata de fopen in variabila descriptor_fisier
        
        ; verificam daca functia fopen a creat cu succes fisierul (daca EAX != 0)
        cmp eax, 0
        je final
        
        ; scriem textul in fisierul deschis folosind functia fprintf
        ; fprintf(descriptor_fisier, text)
        ; se pun parametrii pe stiva de la dreapta la stanga
        push dword text
        push dword [descriptor_fisier]
        call [fprintf]
        add esp, 4*2
        
        ; se pune 0 in fiecare registru, deoacere acestia se modifica la apelurile functiilor
        mov eax, 0
        mov ebx, 0
        mov ecx, 0
        mov edx, 0
        
        mov esi, 0
        
        ; se parcurge sirul text si se numara cate caractere speciale se gasesc
        cld               ; clear DF, se parcurge sirul de la stanga la dreapta
        mov esi, text     ; in ESI se pune adresa sirului
        mov ecx, len_text ; in registrul contor se pune lungimea textului
        
        parcurgere:
            lodsb   ; in AL avem caracterul din sirul text
                    ; inc ESI
                        
            litera_mica:       ; se verifica daca AL apartine intervalului ['a', 'z']
            
                cmp al, 'a'    ; se face scaderea fictiva AL - 'a'
                jb litera_mare ; daca diferenta este STRICT negativa, atunci caracterul din AL e mai mic decat 'a', deci:
                                ; 1. AL apartine ['A', 'Z'] sau ['0', '9']
                                ; 2. AL e caracter special
                
                cmp al, 'z'         ; se face scaderea fictiva AL - 'z'
                jg caracter_special ; daca diferenta este STRICT pozitiva, atunci caracterul din AL e mai mare decat 'z',
                                      ; deci SIGUR este caracter special
                
                ; daca nu se executa nici un salt, inseamna ca AL apartine ['a','z'], deci putem trece la urmatorul caracter din sir
                jmp continuare_parcurgere
                
                
            litera_mare:    ; se verifica daca AL apartine intervalului ['A','Z']
            
                cmp al, 'A'         ; se face scaderea fictiva AL - 'A'
                jb cifra            ; daca diferenta este STRICT negativa, atunci caracterul din AL este mai mic decat 'A', 
                                      ; deci ori este caracter special, ori apartine intervalului ['0','9']
    
                cmp al, 'Z'         ; se face scaderea fictiva AL - 'Z'
                jg caracter_special ; daca diferenta este STRICT pozitiva, atunci caracterul din AL este mai mare decat 'Z',
                                      ; deci SIGUR este caracter special
            
                ; daca nu se executa nici un salt, inseamna ca AL apartine ['A','Z'], deci putem trece la urmatorul caracter din sir
                jmp continuare_parcurgere
            
            
            cifra:  ; se verifica daca AL apartine intervalului ['0', '9']
                
                cmp al, '0'         ; se face scaderea fictiva AL - '0'
                jb caracter_special ; daca diferenta este STRICT negativa, atunci caracterul din AL este mai mic decat '0',
                                      ; deci SIGUR este caracter special

                cmp al, '9'         ; se face scaderea fictiva AL - '9'
                jg caracter_special ; daca diferenta este STRICT pozitiva, atunci caracterul din AL este mai mare decat '9',
                                      ; deci SIGUR este caracter special

                ; daca nu se executa nici un salt, inseamna ca AL apartine ['A','Z'], deci putem trece la urmatorul caracter din sir
                jmp continuare_parcurgere
            
            
            caracter_special:
                inc ebx
                jmp continuare_parcurgere
                
                
            continuare_parcurgere:
                dec ecx
                cmp ecx, 0
                jg parcurgere
        
        ; se va apela printf(contor_message, EBX) => se va afisa: "Numarul de caractere speciale = 3"
        ; se pun parametrii pe stiva de la dreapta la stanga
        
        push dword ebx         ; contorul
        push dword contor_message ; adresa string-ului
        
        call [printf]          ; apelul functiei
        add esp, 4 * 2         ; eliberam parametrii de pe stiva; 4 = dimensiunea unui dword; 2 = nr de parametri
        
        ; apelam functia fclose pentru a inchide fisierul
        ; fclose(descriptor_fisier)
        push dword [descriptor_fisier]
        call [fclose]
        add esp, 4
        
    final:
        push dword 0      ; punem pe stiva parametrul pentru exit
        call [exit]       ; apelam exit pentru a incheia programul