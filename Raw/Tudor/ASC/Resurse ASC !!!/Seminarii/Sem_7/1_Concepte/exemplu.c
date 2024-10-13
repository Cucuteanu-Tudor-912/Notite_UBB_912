#include <stdio.h>

// declarare functie
int functia1(int, int);


// punctul de intrare in program
int main(void)
{
    int sum = functia1(2, 3);
    printf("Suma: %d", sum);
    
    return 0;
}


// definire functie
int functia1(int a, int b)
{
    int sum = a + b;
    return sum;
}
