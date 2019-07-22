#include <stdio.h>
#include <stdlib.h>

int i , j;

int main()
{
    for(i=0;i<3;i++)
    {
        for (j=0;j<3;j++)
        {
            printf("(%i,%i) ",i,j);
        }
        printf("\n");
    }
    return 0;
}
