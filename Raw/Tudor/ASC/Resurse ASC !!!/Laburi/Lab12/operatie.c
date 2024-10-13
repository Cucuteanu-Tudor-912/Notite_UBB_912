// MAIN FILE

#include <stdio.h>

// functia declarata in fisierul lab12.asm
int operatie(int a, int b, int c);

int main()
{
    // se declara variabilele
    int a = 0;
    int b = 0;
    int c = 0;
    int rezultat = 0;
    
    // se citesc numerele de la tastatura
    printf("a = ");
    scanf("%d", &a);    
    
    printf("b = ");
    scanf("%d", &b);    
    
    printf("c = ");
    scanf("%d", &c);
    
    // se apeleaza functia scrisa in limbaj de asamblare
    rezultat = operatie(a, b, c);
    
    // se afiseaza valoarea calculata in functie
    printf("a + b - c = %d", rezultat);
    return 0;
    
}

    
    
    
    