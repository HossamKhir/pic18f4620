
#include "recursion.h"

int ret_factorial(int num)
{

    if ( num <= 2)
    {
        return num;
    }
    else
    {
        return num * ret_factorial(num-1);
    }
}
