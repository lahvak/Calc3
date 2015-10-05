#version 3.5; 
#include "colors.inc"
#include "functions.inc"

#include "setup.inc"

#include "curve_calc.inc"

#declare CamLoc = Pos + 0.1*N - 1.1*T + 0.1*B;

camera {
   location CamLoc
   look_at Pos + 0.05*N
   sky N
   angle 35
}

Curve(XFun, YFun, ZFun, Black, .01, 0, 4*pi, 300)
TNBFrame(0.001)
OscCirc(0.008)

