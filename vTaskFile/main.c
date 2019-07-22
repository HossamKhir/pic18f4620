#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>

const char st[5] = "Ahmed", nst[3] = "Ali";
char cpy[5];

int main()
{
    char ch;
    FILE *text = fopen("Ahmet.txt","r");
    if (text)
    {
        while ((ch = getc(text)) != EOF)
        {
            if (ch == 'A')
            {
                int i = 0;
                cpy[0] = 'A';
                for (i = 1; i <= 5; i++)
                {
                    ch = getc(text);
                    cpy[i] = ch;
                }
                if (strcmp(st,cpy))
                {
                    for (i = 0; i <= 2; i++)
                    {
                        putchar(nst[i]);
                    }
                }
                else
                {
                    for (i = 0; i <= 5; i++)
                    {
                        putchar(cpy[i]);
                    }
                }

            }
            putchar(ch);
        }
    }
    return 0;
}
