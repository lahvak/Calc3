import three;
import graph;
import graph3;

size(200,200,IgnoreAspect);

currentprojection=perspective((4,2,3));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));


real f(pair z) {return 6 + 0.7*(z.x - 3)^3 - 0.7*(z.x - 3);}

real x(real t) {return t;}
real y(real t) {return 0;}

real t0 = 1;
real t1 = 5;

triple curve(real t) {return (x(t), y(t), 0);}
triple topcurve(real t) {return (x(t), y(t), f((x(t),y(t))));}

path xycurve = graph(x, y, t0, t1, operator ..);

pair xymins = min(xycurve);
pair xymaxs = max(xycurve);

triple mins = (xymins.x,xymins.y,-1);
triple maxs = (xymaxs.x,xymaxs.x,13);

triple verytopcurve(real t) {return (x(t), y(t), maxs.z);}

triple integralsurf(pair z){
    real t = z.x;
    real u = z.y;
    triple xyz = topcurve(t);
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

string inttext = "$\displaystyle\int_a^b f(x)\;dx$";

// Features:

bool Surface=false;
bool Curve=true;
bool Top=true;
bool Sides=true;
bool Axes=true;
bool IntSurface=true;
bool IntText=true;

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
    label("$a$",curve(t0), align=S);
    label("$b$",curve(t1), align=S);
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
    draw(surface(xscale(0.5)*yscale(0.25)*inttext,textwall,5,.6,0.0125,bottom=false));
}
