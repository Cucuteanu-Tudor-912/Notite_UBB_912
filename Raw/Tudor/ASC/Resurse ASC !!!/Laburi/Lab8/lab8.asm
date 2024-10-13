;APELURI DE FUNCTII SISTEM

;Se dau doua numere naturale a si b (a, b: word, definite in segmentul de date). Sa se calculeze a/b si sa se afiseze catul si restul impartirii ;in urmatorul format: "Cat = <cat>, rest = <rest>"
;Exemplu: pentru a=23 si b=10 se va afisa: "Cat = 2, rest = 3"

;Valorile vor fi afisate in format decimal (baza 10) cu semn.

bits 32 ;asamblare si compilare pentru arhitectura de 32 biti

global  start 

; declararea functiilor externe folosite de program
extern exit, printf         ; adaugam printf ca functie externa            
import exit msvcrt.dll    
import printf msvcrt.dll    ; indicam asamblorului ca functia printf se gaseste in libraria msvcrt.dll

segment  data use32 class=data
	a dw 23
    b dw 10
    cat_message db "Cat = %d, ", 0   ; %d va fi inlocuit cu catul celor doua numere (AX)
    rest_message db "Rest = %d", 0   ; %d va fi inlocuit cu restul celor doua numere (DX)
   
segment  code use32 class=code ; segmentul de cod
    start:
        
        ; se pune 0 in fiecare registru
        mov eax, 0
        mov ebx, 0
        mov ecx, 0
        mov edx, 0
        
        mov ax, [a] ; AX = 23
        cwd
        ;mov bx, [b] ; BX = 10
        
        ; se face impartirea
        idiv word[b]     ; AX = 2 (in AX este catul impartirii)
                    ; DX = 3 (in DX este restul impartirii)
        
        mov bx, ax
        ;mov eax, 0
        
        mov ax, dx
        cwde
        mov edx, eax
        push edx    ; se pune EDX pe stiva, deoarece dupa apelul functiei, EDX se modifica
        
        ; se va apela printf(cat_message, EAX) => se va afisa: "Cat = 2, "
        ; se pun parametrii pe stiva de la dreapta la stanga
        
        mov ax, bx
        cwde
        push dword eax         ; catul
        push dword cat_message ; adresa string-ului
        
        call [printf]          ; apelul functiei
        add esp, 4 * 2         ; eliberam parametrii de pe stiva; 4 = dimensiunea unui dword; 2 = nr de parametri
        
        ; se va apela printf(rest_message, EDX) => se va afisa: "Rest = 3"
        ; se pun parametri pe stiva de la dreapta la stanga
        
        pop edx
        
        push dword edx          ; restul
        push dword rest_message ; adresa string-ului
        
        call [printf]          ; apelul functiei
        add esp, 4 * 2         ; eliberam parametrii de pe stiva; 4 = dimensiunea unui dword; 2 = nr de parametri
    
    push dword 0      ; punem pe stiva parametrul pentru exit
    call [exit]       ; apelam exit pentru a incheia programul
