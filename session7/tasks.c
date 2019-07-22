#include "tasks.h"

char arr_remove(char arr[], int i2r, int len)
{
    int i;
    for (i = i2r; i < len; i++)
    {
        arr[i] = arr[i+1];
    }
    return arr;
}
int mat_transpose(int mat[3][3])
{
    int row, col, trMat[3][3];
    for (row = 0; row < 3; row++)
    {
        for (col = 0; col < 3; col++)
        {
            trMat[row][col] = mat[col][row];
        }
    }
    return trMat;
}
