import three;
import graph3;

texpreamble("\usepackage{bm}");

size(200,200);

currentprojection=perspective((4,2,3));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));


typedef real multifun(pair);
typedef real realfun(real);
typedef triple paramfun(real);
typedef triple param2fun(pair);

param2fun mkparamfun(multifun x, multifun y, multifun z) {
    return new triple(pair w) {return (x(w), y(w), z(w));};
}

paramfun uslice(param2fun f, real u){
    return new triple(real v) { return f((u, v));};
}

paramfun vslice(param2fun f, real v){
    return new triple(real u) { return f((u, v));};
}

real fx(pair w) {return 0.7*w.y^3 + w.y + 3*w.x;}
real fy(pair w) {return w.y - w.x + 0.5*w.x^2;}
real fz(pair w) {return 2 - w.y^2 - w.x^3;}

real u0 = 0;
real v0 = 0;
pair w0 = (u0,v0);

pair wmin = (-.7,-.3);
pair wmax = (1,1);

real vector_scale = .5;

// Features:

bool Surface=true;
bool Traces=true;
bool TVectors=true;
bool NVector=false;
bool Parallelogram=true;

param2fun f = mkparamfun(fx, fy, fz);

triple numdiff(paramfun f, real t, real h = 1e-4){
    return (f(t+h) - f(t-h))/(2*h);
}

paramfun fu0 = uslice(f,u0);
paramfun fv0 = vslice(f,v0);

paramfun fu1 = uslice(f,u0+vector_scale);
paramfun fv1 = vslice(f,v0+vector_scale);

path3 areaboundu = graph(fu1,v0,v0+vector_scale,operator ..);
path3 areaboundv = graph(fv1,u0,u0+vector_scale,operator ..);

triple tanu = numdiff(fu0, v0);
triple tanv = numdiff(fv0, u0);

path3 uslice = graph(fu0,wmin.y,wmax.y,operator ..);
path3 vslice = graph(fv0,wmin.x,wmax.x,operator ..);

//Surface
if(Surface){
    draw(surface(f, wmin, wmax, nu=30,Spline),gray+opacity(.5));
    draw(surface(f, w0, w0 + (vector_scale,vector_scale), nu=30,Spline),yellow);
}

//Traces
if(Traces){
    draw(uslice, blue+linewidth(.5pt));
    draw(vslice, green+linewidth(.5pt));
    draw(areaboundu, gray+linewidth(.3pt));
    draw(areaboundv, gray+linewidth(.3pt));
}


//Tangent vectors
if(TVectors){
    draw(f(w0) -- (f(w0) + vector_scale * tanu), blue+linewidth(.6pt),Arrow3(),
    L=Label("$\bm{r}_v\;dv$", position=EndPoint, align=E));
    draw(f(w0) -- (f(w0) + vector_scale * tanv), green+linewidth(.6pt),Arrow3(),
    L=Label("$\bm{r}_u\;du$", position=EndPoint, align=W));
}

if(NVector){
    triple nvect = cross(tanv, tanu);
    draw(f(w0) -- (f(w0) + vector_scale * nvect), red+linewidth(.6pt),Arrow3(),
    L=Label("$\bm{n}$", position=EndPoint, align=N));
}

if(Parallelogram){
    draw(surface(f(w0) -- (f(w0) + vector_scale * tanu) -- (f(w0) + vector_scale * tanu
    + vector_scale * tanv) -- (f(w0) + vector_scale * tanv) -- cycle),
    magenta+opacity(.5));
}
