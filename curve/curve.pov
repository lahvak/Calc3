#version 3.5; 
#include "colors.inc"
#include "functions.inc"

#include "setup.inc"

#macro Curve (Xfun,Yfun,Zfun,Color,Thickness,STime,ETime,NSteps)
    sphere_sweep {
        cubic_spline
        NSteps+3,
        #declare Step = (ETime - STime)/NSteps;
        #declare Index = -1;
        #while(Index <= NSteps+1)
            #declare T = STime + Index*Step;
            <Xfun(T),Yfun(T),Zfun(T)>, Thickness
            #declare Index = Index + 1;
        #end
        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
        no_shadow
    }
#end

#declare XFun = function(x){(2+cos(1.5*x))*cos(x)}; 
#declare YFun = function (x) {sin(1.5*x)};
#declare ZFun = function (x) {(2+cos(1.5*x))*sin(x)};

#macro Vector(Start, Components, Color, Thickness)
    cylinder {Start,Start + .9*Components, Thickness texture{pigment {color Color}}}
    cone {Start + .9*Components, 3*Thickness  Start + Components,0 texture {pigment {color Color}}} 
#end

Curve(XFun, YFun, ZFun, Black, .01, 0, 4*pi, 300)
#declare Time = 4*pi*clock;
#declare Eps = 0.001;
#declare Pos = <XFun(Time), YFun(Time), ZFun(Time)>;
#declare DPos = (<XFun(Time+Eps), YFun(Time+Eps), ZFun(Time+Eps)> - <XFun(Time-Eps), YFun(Time-Eps), ZFun(Time-Eps)>)/(2*Eps);
#declare T = vnormalize(DPos);
#declare TME = vnormalize(<XFun(Time), YFun(Time), ZFun(Time)> - <XFun(Time-2*Eps), YFun(Time-2*Eps), ZFun(Time-2*Eps)>)/(2*Eps);
#declare TPE = vnormalize(<XFun(Time+2*Eps), YFun(Time+2*Eps), ZFun(Time+2*Eps)> - <XFun(Time), YFun(Time), ZFun(Time)>)/(2*Eps);
#declare N = vnormalize((TPE - TME)/(2*Eps));
#declare B = vcross(T,N);

Vector(Pos,T,Red,.01)
Vector(Pos,N,Green,.01)
Vector(Pos,B,Blue,.01)

