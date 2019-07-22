#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include "fun.h"

FILE *nFile;

typedef struct ses
{
    int el0;
    char el1[20];
}   SES;
/*
void printing(SES *ptr)
{
    printf("%i\n%s\n",ptr->el0,ptr->el1);
}

void fill_struct_array(SES *ptr, char *cptr)
{
    int i = 0;
    while (*cptr != '\0')
    {
        ptr->el1[i] = *cptr;
        i++;
        cptr++;
    }
}

SES *structReturned(SES *ptr)
{
    scanf("%i",&ptr->el0);
    fflush(stdin);
    gets(ptr->el1);
    return ptr;
}
*/

void prArr(SES **ptr)
{
    int i = 0;
    for(i = 0; i < 2; i++)
    {
        printf("id:\t%i\n",(*(ptr + i))->el0);
        printf("name:\t%s\n",(*(ptr + i))->el1);
    }
}

int main()
{
    char data;
    nFile = fopen("thisFileIsBitching.txt","w");
    while((data = getche()) != 13)
    {
        putc(data, nFile);
    }
    putc('\n',nFile);
    fputc('0',nFile);
    fputs("endOfText",nFile);
    SES *nptr[2];

    SES adam = {0, "Adam"};
    SES eve = {1, "Eve"};

    nptr[0] = &adam;
    nptr[1] = &eve;

    SES **nn = nptr;

    prArr(nn);

    //SES nw = {10, "number"};
    //printing(&nw);
    //fill_struct_array(&nw,"notNumber");
    //printing(structReturned(&nw));
    return 0;
}
