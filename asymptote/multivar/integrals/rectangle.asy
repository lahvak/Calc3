import three;
import graph3;

size(200,200,IgnoreAspect);

currentprojection=perspective((4,2,3));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));


real f(pair z) {return 8-(z.y-2)^2-(z.x-2)^2*(z.x-3);}

real x0 = 2;
real y0 = 2;

triple mins = (1,1,-1);
triple maxs = (4,4,10);

real vector_scale = .7;

// Features:

bool Surface=true;
bool Walls=true;
bool Floor=true;
bool Axes=true;
bool XTrace=false;
bool YTrace=false;
bool XSlice=false;
bool YSlice=false;

typedef real multifun(pair);
typedef real realfun(real);

realfun const(real c){ return new real(real x) { return c;};}


realfun xslice(multifun f, real x0){
    return new real (real y) { return f((x0, y));};
}

realfun yslice(multifun f, real y0){
    return new real (real x) { return f((x, y0));};
}

path3 backedge = graph(const(mins.x),identity,xslice(f,mins.x),mins.y,maxs.y,operator ..);
path3 frontedge = graph(const(maxs.x),identity,xslice(f,maxs.x),mins.y,maxs.y,operator ..);
path3 leftedge = graph(identity,const(mins.y),yslice(f,mins.y),mins.x,maxs.x,operator ..);
path3 rightedge = graph(identity,const(maxs.y),yslice(f,maxs.y),mins.x,maxs.x,operator ..);

path3 xtrace = graph(const(x0),identity,xslice(f,x0),mins.y,maxs.y,operator ..);
path3 ytrace = graph(identity,const(y0),yslice(f,y0),mins.x,maxs.x,operator ..);

//Axes
draw((0,0,0)--(maxs.x+1,0,0),red,Arrow3(),L = Label("$x$",1));
draw((0,0,0)--(0,maxs.y+1,0),red,Arrow3(),L = Label("$y$",1));
draw((0,0,0)--(0,0,maxs.z),red,Arrow3(),L = Label("$z$",1));

//Surface
if(Surface){
    draw(surface(f,(mins.x, mins.y),(maxs.x, maxs.y),nx=10,Spline),gray+opacity(.5));
}

//Walls
if(Walls){
    draw(surface((mins.x, mins.y, 0)--backedge--(mins.x,maxs.y,0)--cycle),gray+opacity(.5));
    draw(surface((maxs.x, mins.y, 0)--frontedge--(maxs.x,maxs.y,0)--cycle),gray+opacity(.5));
    draw(surface((mins.x, mins.y, 0)--leftedge--(maxs.x,mins.y,0)--cycle),gray+opacity(.5));
    draw(surface((mins.x, maxs.y, 0)--rightedge--(maxs.x,maxs.y,0)--cycle),gray+opacity(.5));
}

//Floor
if(Floor){
    draw(surface((mins.x, mins.y,0)--(mins.x,maxs.y,0)--(maxs.x,maxs.y,0)--(maxs.x,mins.y,0)--cycle),
         gray+opacity(.5));
    draw((mins.x, mins.y,0)--(mins.x,maxs.y,0)--(maxs.x,maxs.y,0)--(maxs.x,mins.y,0)--cycle, black);
    draw((mins.x,0,0)--(mins.x,mins.y,0), black+dotted);
    draw((maxs.x,0,0)--(maxs.x,mins.y,0), black+dotted);
    label("$a$",(mins.x,0,0), align=NW);
    label("$b$",(maxs.x,0,0), align=NW);
    draw((0,mins.y,0)--(mins.x,mins.y,0), black+dotted);
    draw((0,maxs.y,0)--(mins.x,maxs.y,0), black+dotted);
    label("$c$",(0,mins.y,0), align=N);
    label("$d$",(0,maxs.y,0), align=N);
}

//Traces
if(XTrace){
    draw(xtrace, blue+linewidth(.5pt));
    draw((x0,mins.y,0) -- (x0,maxs.y,0), blue+linewidth(.5pt));
    draw((x0,0,0)--(x0,mins.y,0), blue+dotted);
    label("$x$",(x0,0,0), blue, align=NW);
}

if(YTrace){
    draw(ytrace, green+linewidth(.5pt));
    draw((mins.x,y0,0) -- (maxs.x,y0,0), green+linewidth(.5pt));
    draw((0,y0,0)--(mins.x,y0,0), green+dotted);
    label("$y$",(0,x0,0), green, align=N);
}

//Slices
if(XSlice){
    draw(surface((x0,mins.y,0)--xtrace--(x0,maxs.y,0)--cycle), green+opacity(.55));
}
if(YSlice){
    draw(surface((mins.x,y0,0)--ytrace--(maxs.x,y0,0)--cycle), green+opacity(.55));
}

