#include "file.h"

char thisFile[] = "This is US!\n";
static float a_float_number=13.456;

void printer(void)
{
    printf(thisFile);
    printf("%f\n",a_float_number);
}
