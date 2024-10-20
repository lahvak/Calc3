#version 3.5; 
#include "colors.inc"
#include "functions.inc"

#declare CamLoc = < 4, 9, 3>;

#include "setup.inc"

#include "surface.inc"

#declare MinLoc = -.1;
#declare MaxLoc = .5;

#declare Loc = MinLoc + clock*(MaxLoc - MinLoc);

#declare VecLoc = .3;

SurfaceY(Loc,<.5,.5,1>)
Axes(-1.2,1.2,-.7,.7,-1.2,1.2)
Plane(y,Loc)
YCurve(Loc, Green)
YVector(VecLoc,Loc,.3,Red)
