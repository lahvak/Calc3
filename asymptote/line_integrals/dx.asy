import three;
import graph;
import graph3;

size(200,200,IgnoreAspect);

currentprojection=perspective((4,2,3));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));


real f(pair z) {return 10-(z.y-2.5)^2-(z.x-2)^2*(z.x-3);}

real x(real t) {return 0.5 + 1.7*(0.8*(sin(1.7*t))^2 + t/3);}
real y(real t) {return 1 + 0.4*t^2;}
real invy(real y) {return sqrt((y-1)/0.4);}

real t0 = 0;
real t1 = pi;

triple curve(real t) {return (x(t), y(t), 0);}
triple topcurve(real t) {return (x(t), y(t), f((x(t),y(t))));}

triple xcurve(real t) {return (x(t), 0, f((x(t),y(t))));}
triple ycurve(real t) {return (0, y(t), f((x(t),y(t))));}

path xycurve = graph(x, y, t0, t1, operator ..);

pair xymins = min(xycurve);
pair xymaxs = max(xycurve);

triple mins = (xymins.x,xymins.y,-1);
triple maxs = (xymaxs.x,xymaxs.y,15);

real locmaxtime1 = dirtime(xycurve,(0,1));
pair locmaxpt1 = point(xycurve,locmaxtime1);
path xpath1 = subpath(xycurve,locmaxtime1+.01, length(xycurve));
real locmintime1 = dirtime(xpath1,(0,1));
pair locminpt1 = point(xpath1,locmintime1);
path xpath2 = subpath(xpath1,locmintime1+.01, length(xycurve));
real locmaxtime2 = dirtime(xpath2,(0,1));
pair locmaxpt2 = point(xpath2,locmaxtime2);

real tl1 = invy(locmaxpt1.y);
real tl2 = invy(locminpt1.y);
real tl3 = invy(locmaxpt2.y);

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

bool Surface=false;
bool Curve=true;
bool Top=true;
bool Sides=true;
bool Axes=true;
bool IntSurface=true;
bool IntText=false;
bool XProjection=true;
bool YProjection=false;

//Axes
draw((0,0,0)--(maxs.x+1,0,0),red,Arrow3(),L = Label("$x$",1));
draw((0,0,0)--(0,maxs.y+1,0),red,Arrow3(),L = Label("$y$",1));
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
    draw(graph(xcurve,tl1,tl2,operator ..), red);
    draw(surface(xsurf, (tl1,0), (tl2,1), nu=10, nv = 5, Spline),red+opacity(0.5));
    draw(graph(xcurve,tl2,tl3,operator ..), blue);
    draw(surface(xsurf, (tl2,0), (tl3,1), nu=10, nv = 5, Spline),blue+opacity(0.5));
    draw(graph(xcurve,tl3,t1,operator ..), red);
    draw(surface(xsurf, (tl3,0), (t1,1), nu=10, nv = 5, Spline),red+opacity(0.5));

    draw(xcurve(t0) -- topcurve(t0), dashed);
    draw(xcurve(t1) -- topcurve(t1), dashed);
    draw(xcurve(tl1) -- topcurve(tl1), dashed);
    draw(xcurve(tl2) -- topcurve(tl2), dashed);
    draw(xcurve(tl3) -- topcurve(tl3), dashed);
    draw((x(t0),0,0) -- curve(t0), dashed);
    draw((x(t1),0,0) -- curve(t1), dashed);
    draw((x(tl1),0,0) -- curve(tl1), dashed);
    draw((x(tl2),0,0) -- curve(tl2), dashed);
    draw((x(tl3),0,0) -- curve(tl3), dashed);
}

//YProjection
if(YProjection){
    draw(graph(ycurve,t0,t1,operator ..), blue);
    draw(surface(ysurf, (t0,0), (t1,1), nu=20, nv = 5, Spline),blue+opacity(0.5));
    draw(ycurve(t0) -- topcurve(t0), dashed);
    draw(ycurve(t1) -- topcurve(t1), dashed);
    draw((0,y(t0),0) -- curve(t0), dashed);
    draw((0,y(t1),0) -- curve(t1), dashed);
}
