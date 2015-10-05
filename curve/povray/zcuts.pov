#version 3.5; 
#include "colors.inc"
#include "functions.inc"

#include "setup.inc"

#include "surface.inc"

Surface()

Plane(clock, function (x,y,z) { y })

ZCurve (clock,Green)
