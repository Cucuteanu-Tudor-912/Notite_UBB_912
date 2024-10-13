bits 32                         
segment code use32 public code

global calcul

; definim procedura
calcul:
    mov eax, [esp+4]       ; in eax punem valoarea lui a 
    add eax, dword [esp+8]
    sub eax, dword[esp+12]
    
    ret