#include <stdio.h>
#include <stdlib.h>

int num = 128;
int *pnum = NULL;
int nums[5] = {1,2,3,5,7};

int main()
{
    printf("%i\n",num);
    printf("0x%x\n",&num);

    int *dataPtr = (int *)4202496;
    *dataPtr = 14;
    printf("%i\n",*dataPtr);
    return 0;
}
