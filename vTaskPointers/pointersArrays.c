#include "pointersArrays.h"

char string_length(char *ptr)
{
    char i = 0;
    while (*(ptr + i) != '\0')
    {
        i++;
    }
    return i;
}
int string_compare(char *ptr0, char *ptr1)
{
    int len0 = string_length(ptr0);
    int len1 = string_length(ptr1);
    if (len0 > len1)
    {
        return 1;
    }
    else if (len0 < len1)
    {
        return -1;
    }
    else
    {
        char i = 0;
        for (i = 0; i < len0; i++)
        {
            if (*(ptr0 + i) != *(ptr1 + i))
            {
                return 2;
            }
        }
    }
    return 0;
}
void string_copy (char *ptr0, char *ptr1)
{
    char i = 0;
    while(*(ptr1 + i) != '\0')
    {
        *(ptr0 + i) = *(ptr1 + i);
    }
}
void string_n_copy (char *ptr0, char *ptr1, int n)
{
    char i = 0;
    for (i = 0; i < n; i++)
    {
        *(ptr0 + i) = *(ptr1 + i);
    }
}
void int_copy_even(int *ptr0, int *ptr1, int len)
{
    int i = 0, j = 0;
    for (i = 0; i < len; i++)
    {
        if(*(ptr1 += i) % 2 == 0)
        {
            *(ptr0 + j) = *(ptr1 + i);
            j++;
        }
    }
}
void string_copy_fromXtoY(char *ptr0, char *ptr1, char x, char y)
{
    char i = 0;
    for (i = x; i < y - x; i++)
    {
        *(ptr0 + i) = *(ptr1 + x + i);
    }
}
void int_swap(int *ptr0, int *ptr1)
{
    int temp = *ptr1;
    *ptr1 = *ptr0;
    *ptr0 = temp;
}
void sort_ascend(int *ptr, int len)
{
    int i = 0, j = 0;
}
