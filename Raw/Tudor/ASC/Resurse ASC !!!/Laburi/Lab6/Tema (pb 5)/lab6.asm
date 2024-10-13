; Se dau doua siruri de octeti s1 si s2. Sa se construiasca sirul de octeti d, care contine pentru fiecare octet din s2 pozitia sa in s1, sau 0 in caz contrar.
; Exemplu:
; pos: 1, 2, 3, 4, 5 
; s1: 7, 33, 55, 19, 46
; s2: 33, 21, 7, 13, 27, 19, 55, 1, 46 
; d: 2, 0, 1, 0, 0, 4, 3, 0, 5

bits 32 ;asamblare si compilare pentru arhitectura de 32 biti

global  start 

extern  exit 
import  exit msvcrt.dll
segment  data use32 class=data
	S1 db 7, 33, 55, 19, 46 ; se declara sirul S1
    len_s1 equ $-S1  ; stabilim lungimea sirului S1
    S2 db 33, 21, 7, 13, 27, 19, 55, 1, 46  ; se declara sirul S2
    len_s2 equ $-S2  ; stabilim lungimea sirulii S2
	D times len_s2 db 0  ; rezervarea unui spatiu de dimensiune len_s2 pentru sirul destinatie D si initializarea acestuia
   
segment  code use32 class=code ; segmentul de cod
start:
    ; se pune 0 in fiecare registru
    mov eax, 0
    mov ebx, 0
    mov ecx, 0
    mov edx, 0
    
    mov esi, 0
    mov edi, 0
    
    mov ecx, len_s2 ; in registrul contor punem lungimea sirului S2
    mov esi, S2     ; in ESI punem adresa de inceput a sirului S2
    cld             ; parcurgem sirul de la stanga la dreapta (DF=0). 
    mov edi, D      ; in EDI punem adresa de inceput a sirului destinatie
    
    jecxz sfarsit   ; tratam cazul in care ECX = 0 (S2 vid)
    
    parcurgere_s2:
        lodsb       ; in AL e elementul din S2
        mov bl, al  ; se muta elementul in BL, deoarece AL va fi folosit mai tarziu
        mov eax, 0  ; EAX se face 0
        
        push esi    ; se pune ESI pe stiva pentru a se putea pune adresa de inceput a sirului S1
        push ecx    ; se pune ECX pe stiva pentru a se putea retine lungimea lui S1
        
        mov ecx, len_s1 ; lungimea lui S1
        mov esi, 0 ; adresa de inceput a sirului S1
       
        search:
            mov dl, [S1+esi]
            cmp dl, bl  ; se compara cele doua elemente din cele doua siruri
            je found    ; daca sunt egale, inseamna ca s-a gasit elementul din S2 in S1
            inc esi
         
                
        loop search
        
        jmp not_found
        
            found:
                mov eax, esi 
                ;sub eax, S2
                stosb ; mov [edi], AL
                jmp continuare_parcurgere_s2
         
        ;dupa:
        
        ;jecxz not_found
        
        not_found:
                mov al, byte 0
                stosb
                jmp continuare_parcurgere_s2
                
        continuare_parcurgere_s2:
            pop ecx
            pop esi
            ;dec ecx
            ;jmp parcurgere_s2
        
    loop parcurgere_s2
        
    sfarsit:
    
    push    dword 0      ; push the parameter for exit onto the stack
    call    [exit]       ; call exit to terminate the program  