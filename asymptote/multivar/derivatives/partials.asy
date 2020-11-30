import three;
import graph3;

size(200,200,IgnoreAspect);

currentprojection=perspective((4,2,3));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));


real f(pair z) {return 6-z.y^2-z.x^2*(z.x-1);}

real x0 = 1;
real y0 = 1;

triple mins = (-1,-1,-1);
triple maxs = (2,2,10);

real vector_scale = .7;

// Features:

bool Surface=true;
bool Axes=true;
bool Traces=true;
bool Vplanes=true;
bool Vectors=true;
bool Tplane=false;

typedef real multifun(pair);
typedef real realfun(real);

realfun const(real c){ return new real(real x) { return c;};}


realfun xslice(multifun f, real x0){
    return new real (real y) { return f((x0, y));};
}

realfun yslice(multifun f, real y0){
    return new real (real x) { return f((x, y0));};
}

real numdiff(realfun f, real x, real h = 1e-4){
    return (f(x+h) - f(x-h))/(2*h);
}

real diffy = numdiff(xslice(f,x0),y0);
real diffx = numdiff(yslice(f,y0),x0);

multifun tanplane(triple point, real dx, real dy){
    return new real(pair z) {return point.z + dx*(z.x - point.x) + dy*(z.y - point.y);};
}

path3 xslice = graph(const(x0),identity,xslice(f,x0),mins.x,maxs.x,operator ..);
path3 yslice = graph(identity,const(y0),yslice(f,y0),mins.y,maxs.y,operator ..);

//Axes
draw((0,0,0)--(maxs.x,0,0),red,Arrow3(),L = Label("$x$",1));
draw((0,0,0)--(0,maxs.y,0),red,Arrow3(),L = Label("$y$",1));
draw((0,0,0)--(0,0,maxs.z),red,Arrow3(),L = Label("$z$",1));

//Surface
if(Surface){
    draw(surface(f,(mins.x, mins.y),(maxs.x, maxs.y),nx=10,Spline),gray+opacity(.5));
}

//Traces
if(Traces){
    draw(yslice, blue+linewidth(.5pt));
    draw(xslice, green+linewidth(.5pt));
    draw((x0,mins.y,0) -- (x0,maxs.y,0), green+linewidth(.5pt));
    draw((mins.x,y0,0) -- (maxs.x,y0,0), blue+linewidth(.5pt));
    draw((x0,y0,0) -- (x0,y0,f((x0,y0))), linewidth(.2pt));
    label("$x_0$",(x0,0,0), align=S);
    label("$y_0$",(0,y0,0), align=S);
}

//Planes
if(Vplanes){
    draw(surface((x0,mins.y,mins.z)--(x0,maxs.y,mins.z)--(x0,maxs.y,maxs.z)--(x0,mins.y,maxs.z)--cycle), green+opacity(.25));
    draw(surface((mins.x,y0,mins.z)--(maxs.x,y0,mins.z)--(maxs.x,y0,maxs.z)--(mins.x,y0,maxs.z)--cycle), blue+opacity(.25));
    draw((x0,y0,mins.z) -- (x0,y0,maxs.z), dotted);
}

//Tangent vectors
if(Vectors){
    draw((x0,y0,f((x0,y0))) -- (x0, y0+vector_scale, f((x0,y0)) + vector_scale*diffy), green+linewidth(.6pt),Arrow3());
    draw((x0,y0,f((x0,y0))) -- (x0+vector_scale, y0, f((x0,y0)) + vector_scale*diffx), blue+linewidth(.6pt),Arrow3());
}

//Tangent plane
if(Tplane){
    multifun tplane = tanplane((x0, y0, f((x0,y0))), diffx, diffy);
    draw(surface((mins.x, mins.y, tplane((mins.x, mins.y))) --
                 (mins.x, maxs.y, tplane((mins.x, maxs.y))) --
                 (maxs.x, maxs.y, tplane((maxs.x, maxs.y))) --
                 (maxs.x, mins.y, tplane((maxs.x, mins.y))) -- cycle),
                 magenta+opacity(.5));
}
