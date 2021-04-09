import three;
import graph3;

size(200,200,IgnoreAspect);

currentprojection=perspective((4,2,3));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));


real f(pair z) {return 8-(z.y/2)^2-(z.x/2)^2*((z.x/2)-1);}

real x0 = 1.5;
real y0 = 2.5;

triple mins = (-1,-1,-1);
triple maxs = (4,4,10);

real a0 = .5;
real a1 = 3.5;
real c0 = .5;
real c1 = 3.5;

real vector_scale = .7;

// Features:

bool Surface=true;
bool Axes=true;
bool XTrace=true;
bool YTrace=false;
bool XPlane=true;
bool YPlane=false;
bool XInt=true;
bool YInt=false;

typedef real multifun(pair);
typedef real realfun(real);

realfun const(real c){ return new real(real x) { return c;};}


realfun xslice(multifun f, real x0){
    return new real (real y) { return f((x0, y));};
}

realfun yslice(multifun f, real y0){
    return new real (real x) { return f((x, y0));};
}


path3 xslice = graph(const(x0),identity,xslice(f,x0),a0,a1,operator ..);
path3 yslice = graph(identity,const(y0),yslice(f,y0),c0,c1,operator ..);

//Axes
draw((0,0,0)--(maxs.x+.5,0,0),red,Arrow3(),L = Label("$x$",1));
draw((0,0,0)--(0,maxs.y+.5,0),red,Arrow3(),L = Label("$y$",1));
draw((0,0,0)--(0,0,maxs.z),red,Arrow3(),L = Label("$z$",1));

//Surface
if(Surface){
    draw(surface(f,(mins.x, mins.y),(maxs.x, maxs.y),nx=10,Spline),gray+opacity(.5));
}

//Traces
if(XTrace){
    draw(xslice, blue+linewidth(.5pt));
    draw((x0,mins.y,0) -- (x0,maxs.y,0), dashed+blue+linewidth(.5pt));
    label("$x$",(x0,0,0), blue, align=S);
}
if(YTrace){
    draw(yslice, green+linewidth(.5pt));
    draw((mins.x,y0,0) -- (maxs.x,y0,0), dashed+green+linewidth(.5pt));
    label("$y$",(0,y0,0), green, align=S);
}

//Integrals
if(XInt){
    draw(surface((x0, c0, 0) -- xslice -- (x0, c1, 0) -- cycle), blue+opacity(.75));
    draw((x0,c0,0) -- (x0,c1,0), blue+linewidth(.5pt));
    draw((0,c0,0) -- (x0,c0,0), dashed);
    draw((0,c1,0) -- (x0,c1,0), dashed);
    label("$c_0$",(0,c0,0), align=S);
    label("$c_1$",(0,c1,0), align=S);
}
if(YInt){
    draw(surface((a0, y0, 0) -- yslice -- (a1, y0, 0) -- cycle), green+opacity(.75));
    draw((a0, y0, 0) -- (a1,y0,0), green+linewidth(.5pt));
    draw((a0,0,0) -- (a0,y0,0), dashed);
    draw((a1,0,0) -- (a1,y0,0), dashed);
    label("$a_0$",(a0,0,0), align=S);
    label("$a_1$",(a1,0,0), align=S);
}

//Planes
if(XPlane){
    draw(surface((x0,mins.y,mins.z)--(x0,maxs.y,mins.z)--(x0,maxs.y,maxs.z)--(x0,mins.y,maxs.z)--cycle), blue+opacity(.25));
}

if(YPlane){
    draw(surface((mins.x,y0,mins.z)--(maxs.x,y0,mins.z)--(maxs.x,y0,maxs.z)--(mins.x,y0,maxs.z)--cycle), green+opacity(.25));
}

