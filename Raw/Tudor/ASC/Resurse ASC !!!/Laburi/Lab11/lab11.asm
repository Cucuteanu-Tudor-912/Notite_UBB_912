; Se cere se se citeasca numerele a, b si c ; sa se calculeze si sa se afiseze a+b-c.

bits 32 ;asamblare si compilare pentru arhitectura de 32 biti

global start 

; declararea functiilor externe folosite de program
extern exit, printf, scanf, calcul
import exit msvcrt.dll    
import printf msvcrt.dll
import scanf msvcrt.dll

segment data use32 class=data
	a dd 0                       ; in aceasta variabila se stocheaza valoarea lui a 
    txt1 db "a = ", 0            ; mesajul care informeaza utilizatorul ce trebuie sa introduca de la tastatura
	b dd 0                       ; in aceasta variabila se stocheaza valoarea lui b 
    txt2 db "b = ", 0            ; mesajul care informeaza utilizatorul ce trebuie sa introduca de la tastatura
	c dd 0                       ; in aceasta variabila se stocheaza valoarea lui c
    txt3 db "c = ", 0            ; mesajul care informeaza utilizatorul ce trebuie sa introduca de la tastatura
    message db "a + b - c = %d", 0 ; mesajul care se va afisa la final impreuna cu rezultatul
    format  db "%d", 0             ; %d <=> un numar decimal (baza 10)
   
segment code use32 class=code ; segmentul de cod
    start:
        ; apelam functia printf(txt1) pentru a se afisa "a = "
        ; se pun parametrii pe stiva
        push dword txt1
        call [printf]
        add esp, 4*1    ; eliberam parametrii de pe stiva
        
        ; se apeleaza scanf(format, a) pentru a se citi numarul a
        ; se pun parametrii pe stiva
        push dword a 
        push dword format
        call [scanf]
        add esp, 4*2     ; eliberam parametrii de pe stiva
        
        ; apelam functia printf(txt2) pentru a se afisa "b = "
        ; se pun parametrii pe stiva
        push dword txt2
        call [printf]
        add esp, 4*1    ; eliberam parametrii de pe stiva
        
        ; se apeleaza scanf(format, b) pentru a se citi numarul b
        ; se pun parametrii pe stiva
        push dword b
        push dword format
        call [scanf]
        add esp, 4*2     ; eliberam parametrii de pe stiva
        
        ; apelam functia printf(txt3) pentru a se afisa "c = "
        ; se pun parametrii pe stiva
        push dword txt3
        call [printf]
        add esp, 4*1    ; eliberam parametrii de pe stiva
        
        ; se apeleaza scanf(format, c) pentru a se citi numarul c
        ; se pun parametrii pe stiva
        push dword c
        push dword format
        call [scanf]
        add esp, 4*2     ; eliberam parametrii de pe stiva
        
        mov eax, 0
        mov ebx, 0
        mov ecx, 0
        mov edx, 0
        
        ; se apeleaza functia operatie din fisierul operatie.asm
        ; se pun parametrii pe stiva
        push dword [c]
        push dword [b]
        push dword [a]
        call calcul
        
        ; apelam functia printf(message, eax) pentru a se afisa mesajul "a + b - c = eax" (unde in eax e rezultatul operatiei efectuate)
        ; se pun parametrii pe stiva
        push dword eax
        push dword message
        call [printf]
        add esp, 4*2
        
        push dword 0      ; punem pe stiva parametrul pentru exit
        call [exit]       ; apelam exit pentru a incheia programul