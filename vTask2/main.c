/*
    *   File:   main.c
    *   Info:   task no. 2
    *   Author: Hossam Khir-Allah
    *   Date:   02/07/2018

*/

#include <stdio.h>
#include <stdlib.h>


int main()
{
    float pi=3.14159,rad,per,area,n0,n1;
    int scannedInt;
    char scannedChar;
    printf("calculating 3.14 in binary using IEEE 754\n");
    const char str[] = "0 10000000 10010001111010111000010";
    printf(str);
    printf("\nPlease, input radius:\t");
    scanf("%f",&rad);
	per=2*pi*rad;
	area =pi*rad*rad;
    printf("Perimeter =\t%f\tArea =\t%f\n",per,area);
    printf("Please, input 2 numbers:\t");
    scanf("%f%f",&n0,&n1);
    printf("\nSum =\t%f\n",n0+n1);
    printf("Difference =\t%f\n",n0-n1);
    printf("Product =\t%f\n",n0*n1);
    printf("Quotient =\t%f\n",n0/n1);
    printf("Insert an integer:\t");
    scanf("%i",&scannedInt);
    printf("Insert an integer:\t");
    scanf("%i",&scannedInt);
    printf("Insert a character:\t");
    scanf(" %c",&scannedChar);
    return 0;
}
