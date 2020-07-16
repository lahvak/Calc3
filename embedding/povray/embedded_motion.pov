#version 3.5; 
#include "colors.inc"
#include "functions.inc"

#include "setup.inc"
#include "system.inc"

#declare Time = -1 + 2*clock;

Axes(-2,3,-2,3,-2,3,0.012,texture{pigment{color Black}})

NumberLine(10, Orange, Black, NLineStart, NLineEnd, .05)

Curve(8, Orange, Black, 0.05, 1)

SphereSrc(Green, .1, Time)
SphereTgt(Blue, .1, Time)
