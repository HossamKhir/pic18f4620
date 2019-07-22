#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int string_length(char arr[])
{
    int i = 0;
    for(;;)
    {
        if ( arr[i] != '\0')
        {
            i++;
        }
        else
        {
            break;
        }
    }
    return i;
}
int string_compare(char arr1[], char arr2[])
{
    // don't calculate lengths manually, use your function
    int i = 0, len1 = 0, len2 = 0, diff = 0, res = 0;
    while(1)
    {
        if (arr1[i] != '\0')
        {
            len1++;
            i++;
        }
        else
        {
            break;
        }
    }
    i = 0;
    while(1)
    {
        if (arr2[i] != '\0')
        {
            len2++;
            i++;
        }
        else
        {
            break;
        }
    }
    diff = len1 - len2;
    if (diff == 0)
    {
        for(i = 0; i <= len1; i++)
        {
            if (arr1[i] != arr2[i])
            {
                res = -2;   //return -2
                break;
            }
        }
    }
    else if (diff > 0)
    {
        res  = 1;   // return 1
    }
    else
    {
        res = -1;   // return -1
    }
    return res; // return 0
}
void string_copy(char arr1[], char arr2[])
{
    int i = 0;
    while (arr2[i] != '\0')
    {
        arr1[i] = arr2[i];
        i++;
    }
}
void string_n_copy(char arr1[], char arr2[], int len)
{
    int i;
    for (i = 0; i < len; i++)
    {
        arr1[i] = arr2[i];
    }
}
void int_copy_even(int arr1[], int arr2[])  // should provide its length
{
    int i = 0,j = 0;
    while(1)
    {
        if (arr2[i] == -1)
        {
            break;
        }
        else if (arr2[i] % 2 == 0)  // this section is fine of some sorts
        {
            i++;
            arr1[j] = arr2[i];
            j++;
        }
    }
}
void string_copy_fromXtoY(char arr1[], char arr2[], int st, int en)
{
    int i;
    for (i = 0; i <= en - st; i++)
    {
        arr1[i] = arr2[st + i];
    }
}
void summing_array(int arr1[][])

int main()
{

    return 0;
}
