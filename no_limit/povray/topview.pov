#version 3.5; 
#include "colors.inc"
#include "functions.inc"

#declare CamLoc = <6*cos(pi/4)*cos(clock*pi/2), 4+2*sin(clock*pi/2), 6*sin(pi/4)*cos(clock*pi/2)>;

#include "setup.inc"

#include "surface.inc"

Surface1()
Axes(-1.2,1.2,-.7,.7,-1.2,1.2)
Plane(.3, function (x,y,z) { y })
ZCurveFull(.3, Green)
