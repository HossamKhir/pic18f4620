#line 1 "G:/embeddedDiploma/proteusFiles/session14/ecu_led.c"
#line 1 "g:/embeddeddiploma/proteusfiles/session14/ecu_led.h"
#line 1 "g:/embeddeddiploma/proteusfiles/session14/hal_gpio.h"
#line 1 "g:/embeddeddiploma/proteusfiles/session14/ral_gpio.h"
#line 1 "g:/embeddeddiploma/proteusfiles/session14/sys_types.h"



typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long uint32_t;
#line 24 "g:/embeddeddiploma/proteusfiles/session14/hal_gpio.h"
void port_on_iff_init(uint16_t *ptr, uint8_t pin, uint8_t state);
void port_io_init(uint16_t *ptr, uint8_t pin, uint8_t state);
