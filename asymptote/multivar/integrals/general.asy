import three;
import graph;
import graph3;

size(200,200,IgnoreAspect);

currentprojection=perspective((4,2,3));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));


real f(pair z) {return 10-(z.y-2)^2-(z.x-2)^2*(z.x-3);}

real x(real t) {return 2 + 1.5*cos(t) + 0.1*sin(3*t);}
real y(real t) {return 3 + 2*sin(t) + 0.05*cos(4*t);}

pair curve(real t) {return (x(t), y(t));}

real t0 = 0;
real t1 = 2*pi;

path boundary = graph(x, y, t0, t1, operator ..);

real x0 = 1;
real y0 = 2;

real[] xtimes = times(boundary, x0);
real[] ytimes = times(boundary, (0, y0));
real[] mints = mintimes(boundary);
real[] maxts = maxtimes(boundary);

real miny = point(boundary, xtimes[0]).y;
real maxy = point(boundary, xtimes[1]).y;
real minx = point(boundary, ytimes[0]).x;
real maxx = point(boundary, ytimes[1]).x;

pair xymins = min(boundary);
pair xymaxs = max(boundary);
pair center = (xymins + xymaxs)/2;

triple minxpt = (point(boundary, mints[0]).x, point(boundary, mints[0]).y, 0);
triple minypt = (point(boundary, mints[1]).x, point(boundary, mints[1]).y, 0);
triple maxxpt = (point(boundary, maxts[0]).x, point(boundary, maxts[0]).y, 0);
triple maxypt = (point(boundary, maxts[1]).x, point(boundary, maxts[1]).y, 0);

triple mins = (xymins.x,xymins.y,-1);
triple maxs = (xymaxs.x,xymaxs.y,15);

triple xyf(pair z){
    real t = z.x;
    real u = z.y;
    pair bdpoint = curve(t);
    real ang = angle(bdpoint - center);
    real rad = u*length(bdpoint - center);
    pair xy = center + rad*expi(ang);
    return (xy.x, xy.y, f(xy));
}

triple boundarysurf(pair z){
    real t = z.x;
    real u = z.y;
    pair xy = curve(t);
    return (xy.x, xy.y, u*f(xy));
}

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

path3 xtrace = graph(const(x0),identity,xslice(f,x0),miny,maxy,operator ..);
path3 ytrace = graph(identity,const(y0),yslice(f,y0),minx,maxx,operator ..);


path3 boundary3 = graph(x, y, const(0), t0, t1, operator ..) .. cycle;


//Axes
draw((0,0,0)--(maxs.x+1,0,0),red,Arrow3(),L = Label("$x$",1));
draw((0,0,0)--(0,maxs.y+1,0),red,Arrow3(),L = Label("$y$",1));
draw((0,0,0)--(0,0,maxs.z),red,Arrow3(),L = Label("$z$",1));

//Surface
if(Surface){
    draw(surface(xyf,(t0, 0),(t1,1),nu=20,nv=10,Spline,Spline),gray+opacity(.5));
}

//Walls
if(Walls){
    draw(surface(boundarysurf, (t0,0), (t1,1), nu=20, nv = 5, Spline),gray+opacity(.5));
}

//Floor
if(Floor){
    draw(surface(boundary3), gray+opacity(.5));
    draw(boundary3, black);
    draw((mins.x,0,0)--minxpt, black+dotted);
    draw((maxs.x,0,0)--maxxpt, black+dotted);
    label("$a$",(mins.x,0,0), align=NW);
    label("$b$",(maxs.x,0,0), align=NW);
    draw((0,mins.y,0)--minypt, black+dotted);
    draw((0,maxs.y,0)--maxypt, black+dotted);
    label("$c$",(0,mins.y,0), align=N);
    label("$d$",(0,maxs.y,0), align=N);
}

//Traces
if(XTrace){
    draw(xtrace, blue+linewidth(.5pt));
    draw((x0,miny,0) -- (x0,maxy,0), blue+linewidth(.5pt));
    draw((x0,0,0)--(x0,miny,0), blue+dotted);
    label("$x$",(x0,0,0), blue, align=NW);
}

if(YTrace){
    draw(ytrace, green+linewidth(.5pt));
    draw((minx,y0,0) -- (maxx,y0,0), green+linewidth(.5pt));
    draw((0,y0,0)--(minx,y0,0), green+dotted);
    label("$y$",(0,x0,0), green, align=N);
}

//Slices
if(XSlice){
    draw(surface((x0,miny,0)--xtrace--(x0,maxy,0)--cycle), blue+opacity(.55));
}
if(YSlice){
    draw(surface((minx,y0,0)--ytrace--(maxx,y0,0)--cycle), green+opacity(.55));
}

