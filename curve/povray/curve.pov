#version 3.5; 
#include "colors.inc"
#include "functions.inc"

#include "setup.inc"

#include "curve_calc.inc"

Curve(XFun, YFun, ZFun, Black, .01, 0, 4*pi, 300)
TNBFrame(0.009)

