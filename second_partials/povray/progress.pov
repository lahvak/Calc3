#version 3.5; 
#include "colors.inc"
#include "functions.inc"

#declare CamLoc = < 3, 6, 2>;

#include "setup.inc"

#include "surface.inc"

SurfaceX(.3,<.5,.5,1>)
Axes(-1.2,1.2,-.7,.7,-1.2,1.2)
Plane(x,.3)
XCurve(.3, Green)
XVector(.3,.1,.3,Red)
//YCurve(.5, Blue)
//YVector(.3,.5, .3, Magenta)
