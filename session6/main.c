#include <stdio.h>
#include <stdlib.h>
#include "recursion.h"

int arr[5]={11,22,33,55,99};
char carr[5];

int len(int num[], int elements)
{
    return sizeof(*num) * elements / sizeof(char);
}
int main()
{
    int fact = ret_factorial(5);
    printf("%i\n", len(carr,5));
    return 0;
}
