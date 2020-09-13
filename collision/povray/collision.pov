#version 3.5; 
#include "colors.inc"
#include "functions.inc"

#include "setup.inc"

#include "defs.inc"

#declare time = 1 + clock;
//#declare time = 5;

Axes(-2,3,-2,3,-2,3,0.012,texture{pigment{color Black}})

Line(<1,-1,-1>, <-.6,1.0,.8>, time, .06, Blue, .12, Green)
Line(<.2,1.6,-.4>, <-.2,-.3,.5>, time, .06, Red, .12, Orange)

