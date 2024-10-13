;Se da un sir de caractere S. Sa se construiasca sirul D care sa contina toate literele mici din sirul S.
;Exemplu:
;S: 'a', 'A', 'b', 'B', '2', '%', 'x'
;D: 'a', 'b', 'x'

bits 32 ;asamblare si compilare pentru arhitectura de 32 biti

global  start 

extern  exit 
import  exit msvcrt.dll
segment  data use32 class=data
	S db 'a', 'A', 'b', 'B', '2', '%', 'x' ; se declara sirul S
    l equ $-S ; stabilim lungimea sirului S
	D times l db 0 ; rezervarea unui spatiu de dimensiune l pentru sirul destinatie D si initializarea acestuia
   
    
segment  code use32 class=code ; segmentul de cod
start:
    ; se pune 0 in fiecare registru
    mov eax, 0
    mov ebx, 0
    mov ecx, 0
    mov edx, 0
    
    mov ecx, l  ; punem in registrul contor dimensiunea primului sir
    mov esi, 0  ; indicele de la care incepem iterarea
    mov edi, 0  ; indicele din sirul destinatie (D)
    
    jecxz sfarsit   ; tratam cazul in care ECX e 0
    
    repeta:
        mov al,[S+esi]  ; punem in AL elementul de pe pozitia indicata de ESI din sirul S
        
        ; pentru a stabili daca un element este litera mica, se va compara diferenta (in codul ASCII) dintre 'z' si elementul din sir cu diferenta dintre 'z' si 'a'
        
        ; in cazul in care diferenta 1 este mai mica sau egala cu 25 ( 'z' - 'a' = 25), inseamna ca elementul este o litera mica si poate fi adaugat in sirul D
  
        ;mov bl, 'z'-'a' ; BL = 25
        ;mov dl, 'z'  ; in DL se pune 'z' pentru a se putea face scaderea cu valoarea din AL
        
        ;sub dl, al ; se face scaderea 'z' - AL
        ;sub bl, dl ; se face scaderea ('z'-'a') - ('z' - AL) pentru a se compara rezultatul cu 0
    
        ; daca valoarea din BL este pozitiva, inseamna ca elementul din AL este o litera mica si poate fi pus in sirul D
        
        ;cmp bl, 0
        ;jnge not_lit_mica ; daca BL este negativ, nu se va efectua adaugarea in sir
            
        
        cmp al, 'a' ; se face scaderea fictiva AL - 'a'
        jnge not_lit_mica ; daca diferenta nu este pozitiva, inseamna ca elementul nu poate fi litera mica
    
        cmp al, 'z' ; se face scaderea fictiva 'z' - AL
        jnbe not_lit_mica ; daca diferenta nu este negativa, inseamna ca elementul nu este litera mica
        
        mov [D+edi], al
        inc edi
        
        not_lit_mica:
        inc esi ; incrementam indicele la care ne aflam
        
    loop repeta
    sfarsit: ;terminarea programului
 

push    dword 0      ; push the parameter for exit onto the stack
call    [exit]       ; call exit to terminate the program  