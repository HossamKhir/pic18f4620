#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void (*ptr)(void);
void (*ptr_arr[2])(void);

void emptyFunction(void)
{
    int i = 0;
    for(i = 0; i < 11; i++)
    {
        printf("newLine\n");
    }
}

typedef struct newStruct
{
    int element0;
    char element1[20];
    float element2;
} KAPOOM;

KAPOOM no1 = {10, "Conner Kenway", 98.5};

int main()
{
    printf("%i\n%s\n%f\n",no1.element0,no1.element1,no1.element2);
    return 0;
}
