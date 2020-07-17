#version 3.5; 
#include "colors.inc"
#include "functions.inc"

#include "setup.inc"
#include "system.inc"

#declare Time = clock;

Axes(-2,3,-2,3,-2,3,0.012,texture{pigment{color Black}})

NumberLine(10, Orange, Black, NLineStart, NLineEnd, .05)

Curve(10, Orange, Black, 0.05, Time)
