#pragma once
#ifndef _FUN_H
#define _FUN_H

#define G 9.81
#define AREA(L,W) (L * W)

#define FLAG 1
#if FLAG == 0
    #include "F0.h"
#elif FLAG == 1
    //#include "F1.h"
#endif // FLAG
#ifdef DEFY
    #undef DEFY
#endif // DEFY

#endif
