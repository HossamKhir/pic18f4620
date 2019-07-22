
/*
    * File  :   main.c
    * Info  :   A function to print a sentence
    * Author:   Hossam Khir-Allah
    * Date  :   27/06/18
*/
//  link section
#include <stdio.h>
#include <stdlib.h>

//  global declaration
const double pi = 3.14159;

//  prototypes
double perimeter(double r);

//  main function
int main()
{
    printf("Back at C!\n");
    double p=perimeter(.5);
    return 0;
}

// functions declarations
double perimeter(double r)
{
    double p;
    return p = 2 * pi * r;
}
