import three;
import graph;
import graph3;

size(200,200,IgnoreAspect);

currentprojection=perspective((4,2,3));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));


real f(pair z) {return z.x^2 + z.y^2;}

real x(real t) {return sin(t);}
real y(real t) {return 1 - cos(t);}
real invy(real y) {return acos(1 - y);}

real t0 = 0;
real t1 = pi;

triple curve(real t) {return (x(t), y(t), 0);}
triple topcurve(real t) {return (x(t), y(t), f((x(t),y(t))));}

triple xcurve(real t) {return (x(t), 0, f((x(t),y(t))));}
triple ycurve(real t) {return (0, y(t), f((x(t),y(t))));}

path xycurve = graph(x, y, t0, t1, operator ..);

pair xymins = min(xycurve);
pair xymaxs = max(xycurve);

triple mins = (xymins.x,xymins.y,-.5);
triple maxs = (xymaxs.x,xymaxs.y,5);

real locmaxtime1 = dirtime(xycurve,(0,1));
pair locmaxpt1 = point(xycurve,locmaxtime1);

real tl1 = invy(locmaxpt1.y);

triple verytopcurve(real t) {return (x(t), y(t), maxs.z);}

triple integralsurf(pair z){
    real t = z.x;
    real u = z.y;
    triple xyz = topcurve(t);
    return (xyz.x, xyz.y, u*xyz.z);
}

triple xsurf(pair z){
    real t = z.x;
    real u = z.y;
    triple xyz = xcurve(t);
    return (xyz.x, xyz.y, u*xyz.z);
}

triple ysurf(pair z){
    real t = z.x;
    real u = z.y;
    triple xyz = ycurve(t);
    return (xyz.x, xyz.y, u*xyz.z);
}

triple verticalsurf(pair z){
    real t = z.x;
    real u = z.y;
    triple xyz = verytopcurve(t);
    return (xyz.x, xyz.y, u*xyz.z);
}

surface integral = surface(integralsurf, (t0,0), (t1,1), nu=20, nv = 5, Spline);
surface textwall = surface(verticalsurf, (t0,0), (t1,1), nu=20, nv = 5, Spline);

string inttext = "$\displaystyle\int_C f(x,y)\;ds$";

// Features:

bool Surface=true;
bool Curve=true;
bool Top=true;
bool Sides=true;
bool Axes=true;
bool IntSurface=true;
bool IntText=false;
bool XProjection=true;
bool YProjection=false;

//Axes
draw((0,0,0)--(maxs.x+.5,0,0),red,Arrow3(),L = Label("$x$",1));
draw((0,0,0)--(0,maxs.y+.5,0),red,Arrow3(),L = Label("$y$",1));
draw((0,0,0)--(0,0,maxs.z),red,Arrow3(),L = Label("$z$",1));

//Surface
if(Surface){
    draw(surface(f,(mins.x, mins.y),(maxs.x, maxs.y),nx=10,Spline),gray+opacity(.3));
}

//Curve
if(Curve){
    draw(graph(curve,t0,t1,operator ..), black);
    label("$\mathbf{r}(a)$",curve(t0), align=S);
    label("$\mathbf{r}(b)$",curve(t1), align=S);
}

//Top
if(Top){
    draw(graph(topcurve,t0,t1,operator ..), green);
}

//Sides
if(Sides){
    draw(curve(t0) -- topcurve(t0), green);
    draw(curve(t1) -- topcurve(t1), green);
}

//IntSurface
if(IntSurface){
    draw(integral,green+opacity(.5));
}

//IntText
if(IntText){
    draw(surface(xscale(0.5)*yscale(0.3)*inttext,textwall,5,.6,0.0125,bottom=false));
}

//XProjection
if(XProjection){
    draw(graph(xcurve,t0,tl1,operator ..), blue);
    draw(surface(xsurf, (t0,0), (tl1,1), nu=10, nv = 5, Spline),blue+opacity(0.5));
    draw(graph(xcurve,tl1,t1,operator ..), red);
    draw(surface(xsurf, (tl1,0), (t1,1), nu=10, nv = 5, Spline),red+opacity(0.5));

    draw(xcurve(t0) -- topcurve(t0), dashed);
    draw(xcurve(t1) -- topcurve(t1), dashed);
    draw(xcurve(tl1) -- topcurve(tl1), dashed);
    draw((x(t0),0,0) -- curve(t0), dashed);
    draw((x(t1),0,0) -- curve(t1), dashed);
    draw((x(tl1),0,0) -- curve(tl1), dashed);
}
