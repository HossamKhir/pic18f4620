#include <stdio.h>
#include <stdlib.h>

float num0,num1,resultant;
char op;

int main()
{
    printf("Insert the equation:\t");
    scanf("%f %c%f",&num0,&op,&num1);
    switch(op)
    {
    case '+':
        resultant = num0 + num1;
        break;
    case '-':
        resultant = num0 - num1;
        break;
    case '*':
        resultant = num0 * num1;
        break;
    case '/':
        if(num1==0)
        {
            printf("Error:\tDivision by zero!\a\n");
            return 0;
        }
        else
        {
            resultant = num0/num1;
        }
        break;
    default:
        printf("Error:\tUndefined Operator!\n");
        return 0;
    }
    printf("Result=\t%f",resultant);
    return 0;
}
