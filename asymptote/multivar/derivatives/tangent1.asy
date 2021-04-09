import three;
import graph3;

size(200,200,IgnoreAspect);

currentprojection=perspective((4,2,3));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));


real f(pair z) {return z.x^2 + 2*z.y^3-z.x*z.y;}

real x0 = 1;
real y0 = 1;

triple mins = (-.1,-.1,-1);
triple maxs = (1.6,1.6,8);

real vector_scale = .7;

// Features:

bool Surface=true;
bool Axes=true;
bool Traces=true;
bool Tlines=true;
bool Vplanes=false;
bool Vectors=false;
bool Tplane=true;

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

realfun line(real t0, real z0, real slope){
    return new real(real t) { return z0 + slope*(t - t0);};
}

path3 ytline = graph(const(x0), identity, line(x0, f((x0,y0)), diffy), mins.x, maxs.x, operator ..);
path3 xtline = graph(identity, const(y0), line(y0, f((x0,y0)), diffx), mins.y, maxs.y, operator ..);

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
    draw(yslice, blue+linewidth(.5pt),L = Label("$\mathbf{r}(t)$", position=EndPoint, align=N));
    draw(xslice, green+linewidth(.5pt),L = Label("$\mathbf{s}(t)$", position=EndPoint, align=N));
    draw((x0,mins.y,0) -- (x0,maxs.y,0), green+linewidth(.1pt));
    draw((mins.x,y0,0) -- (maxs.x,y0,0), blue+linewidth(.1pt));
    draw((x0,y0,0) -- (x0,y0,f((x0,y0))), linewidth(.1pt));
    label("$1$",(x0,0,0), align=S);
    label("$1$",(0,y0,0), align=S);
}

//Planes
if(Vplanes){
    draw(surface((x0,mins.y,mins.z)--(x0,maxs.y,mins.z)--(x0,maxs.y,maxs.z)--(x0,mins.y,maxs.z)--cycle), green+opacity(.25));
    draw(surface((mins.x,y0,mins.z)--(maxs.x,y0,mins.z)--(maxs.x,y0,maxs.z)--(mins.x,y0,maxs.z)--cycle), blue+opacity(.25));
    draw((x0,y0,mins.z) -- (x0,y0,maxs.z), dotted);
}

//Tangent lines
if(Tlines){
    draw(xtline, blue+dashed+linewidth(1pt));
    draw(ytline, green+dashed+linewidth(1pt));
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
