#include <stdio.h>
#include <stdlib.h>

int globalVar;
const double globalCosnt=9.81;
short f=55;

int main()
{
    printf("%i\n",globalVar);
    int globalVar=5;
    printf("%i\n",globalVar);
    printf("printing float, %f\n", globalCosnt);
    printf("printing float, %0.1f\n", globalCosnt);
    return 0;
}
