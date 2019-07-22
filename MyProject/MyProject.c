void half_toggle(void)
{
    PORTC = 0x55;
    Delay_ms(100);
    PORTC = 0xAA;
    Delay_ms(100);
}

void l2r(void)
{
    int i = 0;
    for (i = 1; i <= 128; i*=2)
    {
        PORTC = i;
        Delay_ms(100);
    }
}

void r2l(void)
{
    int i = 0;
    for (i = 128; i >= 1; i/=2)
    {
        PORTC = i;
        Delay_ms(100);
    }
}

void l2r_double(void)
{
    int i = 0;
    for (i = 3; i <= 192; i*=4)
    {
        PORTC = i;
        Delay_ms(200);
    }
}

void r2l_double(void)
{
    int i = 0;
    for (i = 192; i >= 3; i/=4)
    {
        PORTC = i;
        Delay_ms(200);
    }
}

void main() {
     TRISC = 0x00;
     while(1)
     {
         //half_toggle();
         l2r_double();
         r2l_double();
     }
}