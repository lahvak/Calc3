#macro Curve (Xfun,Yfun,Zfun,Color,Thickness,STime,ETime,NSteps)
    sphere_sweep {
        cubic_spline
        NSteps+3,
        #declare Step = (ETime - STime)/NSteps;
        #declare Index = -1;
        #while(Index <= NSteps+1)
            #local Time = STime + Index*Step;
            <Xfun(Time),Yfun(Time),Zfun(Time)>, Thickness
            #declare Index = Index + 1;
        #end
        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
        no_shadow
    }
#end

#macro Circle (Center,Radius,V1,V2,Color,Thickness,NSteps)
    sphere_sweep {
        cubic_spline
        NSteps+3,
        #declare Step = (2*pi)/NSteps;
        #declare Index = -1;
        #while(Index <= NSteps+1)
            #local Time = Index*Step;
            Center + Radius*cos(Time)*V1 + Radius*sin(Time)*V2, Thickness
            #declare Index = Index + 1;
        #end
        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
        no_shadow
    }
#end


#macro Vector(Start, Components, Color, Thickness)
    cylinder {Start,Start + .9*Components, Thickness texture{pigment {color Color}}}
    cone {Start + .9*Components, 3*Thickness  Start + Components,0 texture {pigment {color Color}}} 
#end

#include "curve.inc"

#declare Time = 4*pi*clock;
#declare Eps = 0.001;
#declare Pos = <XFun(Time), YFun(Time), ZFun(Time)>;
#declare DPos = <XFunp(Time), YFunp(Time), ZFunp(Time)>;
#declare DDPos = <XFunpp(Time), YFunpp(Time), ZFunpp(Time)>;
#declare T = vnormalize(DPos);
#declare N = vnormalize(DDPos - vdot(DDPos,T)*T);
#declare B = vcross(T,N);
#declare Curvature = vlength(vcross(DPos,DDPos))/pow(vlength(DPos),3);
#declare Rad = 1/Curvature;


#macro TNBFrame(Thickness)
    Vector(Pos,T,Red,Thickness)
    Vector(Pos,N,Green,Thickness)
    Vector(Pos,B,Blue,Thickness)
#end

#macro OscCirc(Thickness)
    Circle(Pos + Rad*N,Rad,T,N,Orange,Thickness,100)
#end
