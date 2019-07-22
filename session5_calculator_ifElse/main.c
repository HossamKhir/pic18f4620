#include <stdio.h>
#include <stdlib.h>
#include <string.h>

float num0,num1,resultant;
char op;

int main()
{
    label0:
    printf("Enter your equation:\t");
    scanf("%f %c%f",&num0,&op,&num1);
    if( op == '+')
    {
        resultant = num0 + num1;
    }
    else if ( op == '-')
    {
        resultant = num0 - num1;
    }
    else if ( op == '*')
    {
        resultant = num0 * num1;
    }
    else if ( op == '/')
    {
        if ( num1 == 0)
        {
            printf("Error:\tDivision by zero\a\n");
            goto label0;
        }
        else
        {
            resultant = num0 / num1;
        }
    }
    else
    {
        printf("Error:\tUndefined operator\n");
        goto label0;
    }
    printf("Result=\t%f",resultant);
    return 0;
}
