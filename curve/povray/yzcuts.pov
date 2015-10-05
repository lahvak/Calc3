#version 3.5; 
#include "colors.inc"
#include "functions.inc"

#include "setup.inc"

#include "surface.inc"

Surface()

#if(clock < 0)
    Plane(0, function (x,y,z) { z - (2*clock+1)*y })
    YZCurve (2*clock+1,Green)
#else
    Plane(0, function (x,y,z) { y - (1 - 2*clock)*z })
    ZYCurve (1 - 2*clock,Green)
#end
