#include <stdio.h>
#include <stdlib.h>

#include "file.h"

float a_float_number=5.9;

int main()
{
    int num1,num2;
    printf("insert 2 integers\n");
    scanf("%i%i",&num1,&num2);
    printf("Sum=%i\n",num1+num2);
    printf("Difference=%i\n",num1-num2);
    printf("Product=%i\n",num1*num2);
    printf("Quotient=%f\n",num1/num2);
    if (num1==num2)
        printf("num1 is equal to num2\n");
    if (num1!=num2)
        printf("num1 is NOT equal to num2\n");
    if (num1>num2)
        printf("num1 is larger than num2\n");
    if (num1<num2)
        printf("num1 is less than num2\n");
    if (num1>=num2)
        printf("num1 is larger than or equal to num2\n");
    if (num1<=num2)
        printf("num1 is less than or equal to num2\n");
    return 0;
}
