; Se cere se se citeasca numerele a, b si c ; sa se calculeze si sa se afiseze a+b-c.

bits 32 ;asamblare si compilare pentru arhitectura de 32 biti

global _operatie

segment data public data use32
    
segment code public code use32

_operatie:
    ; se creeaza cadru pe stiva pentru programul apelat
    push ebp
    mov ebp, esp
    
    ; obtinem argumentele transmise pe stiva functiei operatie
    ; la locatia [ebp+4] se afla adresa de return (valoarea din EIP la momentul apelului)
    ; la locatia [ebp] se afla valoarea ebp pentru apelant
    
    mov eax, [esp+8]
    add eax, dword [esp+12]
    sub eax, dword[esp+16]
    
    ; refacem cadrul de stiva pentru programul apelant
    mov esp, ebp
    pop ebp

    ret
    