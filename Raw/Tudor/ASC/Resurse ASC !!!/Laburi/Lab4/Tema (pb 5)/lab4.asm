;Se dau octetii A si B. Sa se obtina dublucuvantul C:
;   bitii 0-3 ai lui C coincid cu bitii 3-6 ai lui B
;   bitii 4-7 ai lui C au valoarea 0
;   bitii 8-10 ai lui C au valoarea 110
;   bitii 11-15 ai lui C coincid cu bitii 0-4 ai lui A
;   bitii 16-31 ai lui C sunt 1

bits 32 ;asamblare si compilare pentru arhitectura de 32 biti

global  start 

extern  exit 
import  exit msvcrt.dll
segment  data use32 class=data
	a db 10100110b ; 1010 0110b = A6h
	b db 11101101b ; 1110 1101b = EDh
	c dd 0 ; c = (0000 0000) (0000 0000) (0000 0000) (0000 0000)
   
;   bitii 0-3 ai lui C coincid cu bitii 3-6 ai lui B : c = (0000 0000) (0000 0000) (0000 0000) (0000 1101)
;   bitii 4-7 ai lui C au valoarea 0 : c = (0000 0000) (0000 0000) (0000 0000) (0000 1101)
;   bitii 8-10 ai lui C au valoarea 110 : c = (0000 0000) (0000 0000) (0000 0110) (0000 1101)
;   bitii 11-15 ai lui C coincid cu bitii 0-4 ai lui A : c = (0000 0000) (0000 0000) (0011 0110) (0000 1101)
;   bitii 16-31 ai lui C sunt 1 : c = (1111 1111) (1111 1111) (0011 0110) (0000 1101)
    
segment  code use32 class=code ; segmentul de cod
start:
    ; se pune 0 in fiecare registru
    mov eax, 0
    mov ebx, 0
    mov ecx, 0
    mov edx, 0

    ; vom construi c in EAX, iar, la final, rezultatul va fi mutat in doubleword[c]
    
    ;se izoleaza bitii 3-6 ai octetului B
    mov bl, [b] ;       BL = 1110 1101b
    and bl, 01111000b ; se zerorizeaza tot, cu exceptia bitilor 3-6 // BL = 0110 1000b
    
    mov cl, 3 ;         indicam cati biti rotim
    ror bl, cl ;        rotim la dreapta cu 3 pozitii astfel incat sa aliniem continutul bitilor
    
    or eax, ebx ;        punem bitii in rezultat (EAX = 0000000Dh = 0000 0000 0000 0000 0000 0000 0000 1101b)
    
    ; pana acum, s-au rezolvat primele doua subpuncte (0-3 = Dh = 1101b si 4-7 = 0h = 0000b)
    
    mov ebx, 0
    mov bx, 0000000000000110b ; BX = 0006h = 0000 0000 0000 0110b
                              ; gruparea de biti (0110) trebuie sa fie mutati pe bitii 8-11
    shl bx, 8                 ; rotim la stanga 8 pozitii (BX = 0000 0110 0000 0000b)
    or eax, ebx               ; punem bitii in rezultat (EAX = 0000060Dh = 0000 0000 0000 0000 0000 0110 0000 1101b)

    ; pana acum, s-au rezolvat primele 3 subpuncte (0-3 = Dh = 1101b // 4-7 = 0h = 0000b // 8-10 = 6 = 0110b)
    
    mov ebx, 0
    mov bx, [a]               ; BX = 0000 0000 1010 0110bb = A6h
                              ; bitii 1-4 din A (0011) trebuie sa fie mutati pe bitii 11-15 din eax
    and bx, 0000000000011110b ; BX = 0000 0000 0000 0110b
    shl bx, 11                ; rotim la stanga 11 pozitii (BX = 0011 0000 0000 0000b)
    or eax, ebx               ; punem bitii in rezultat (EAX = 0000360Dh = 0000 0000 0000 0000 0011 0110 0000 1101b)
    
    ; pana acum, s-au rezolvat primele 4 subpuncte (0-3 = Dh = 1101b // 4-7 = 0h = 0000b // 8-11 = 6h = 0110b // 12-15 = 3h = 0011b)
    ; se completeaza restul de 16-31 biti din eax cu 1
    or eax, 11111111111111110000000000000000b 
    
    ; punem valoarea din registru in variabila rezultat
    mov  [c], eax ; rezultatul tot in eax ramane 
    
push    dword 0      ; push the parameter for exit onto the stack
call    [exit]       ; call exit to terminate the program  
    