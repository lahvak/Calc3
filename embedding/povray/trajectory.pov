#version 3.5; 
#include "colors.inc"
#include "functions.inc"

#include "setup.inc"
#include "system.inc"

#declare Time = -1 + 2*clock;

Axes(-2,3,-2,3,-2,3,0.012,texture{pigment{color Black}})

NumberLine(1, Green, Green, NLineStart, NLineEnd, .02)

Trajectory(Blue, .02, Time)

SphereSrc(Green, .1, Time)
SphereTgt(Blue, .1, Time)

