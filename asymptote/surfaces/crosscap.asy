import three;
import graph3;

size(200,200);

currentprojection=perspective((4,2,3));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));


typedef real multifun(pair);
typedef real realfun(real);
typedef triple paramfun(real);
typedef triple param2fun(pair);

typedef real seqfun(int);

seqfun mkseq(real a, real b, int n){
    real step = (b-a)/n;
    return new real(int k) {return a + k*step;};
}

param2fun mkparamfun(multifun x, multifun y, multifun z) {
    return new triple(pair w) {return (x(w), y(w), z(w));};
}

paramfun uslice(param2fun f, real u){
    return new triple(real v) { return f((u, v));};
}

paramfun vslice(param2fun f, real v){
    return new triple(real u) { return f((u, v));};
}

//real fx(pair w) {return 3*cos(w.x)*sin(2*w.y);}
//real fy(pair w) {return 3*sin(w.x)*sin(2*w.y);}
//real fz(pair w) {return 3*(cos(w.y)^2 - cos(w.x)^2*sin(w.y)^2);}
real fx(pair w) {return 3*sin(w.x)*sin(2*w.y);}
real fy(pair w) {return 3*sin(2*w.x)*sin(w.y)^2;}
real fz(pair w) {return 3*cos(2*w.x)*sin(w.y)^2;}

pair wmin = (0,0);
pair wmax = (2*pi,pi/2);

real [] useq = sequence(mkseq(wmin.x, wmax.x, 40), 41);
real [] vseq = sequence(mkseq(wmin.y, wmax.y, 10), 11);

real vector_scale = .7;

// Features:

param2fun f = mkparamfun(fx, fy, fz);

triple numdiff(paramfun f, real t, real h = 1e-4){
    return (f(t+h) - f(t-h))/(2*h);
}

//Surface
draw(surface(f, wmin, wmax, nu=60, nv = 20, usplinetype = new splinetype[] {notaknot,
notaknot, monotonic}),gray+opacity(.6));

for(real u : useq){
    paramfun fu = uslice(f, u);
    for(real v : vseq){
        paramfun fv = vslice(f, v);
        triple tanu = numdiff(fu, v);
        triple tanv = numdiff(fv, u);
        triple nvect = unit(cross(tanv, tanu));
        if(u <= pi/2 || u >=3*pi/2){
        draw(f((u,v)) -- (f((u,v)) + vector_scale * nvect), red+linewidth(.3pt),Arrow3());
        dot(f((u,v)), red+linewidth(1.2));
        } else {
        draw(f((u,v)) -- (f((u,v)) + vector_scale * nvect), green+linewidth(.3pt),Arrow3());
        dot(f((u,v)), green+linewidth(1.2));
        }
    }
}

draw(graph(vslice(f, wmax.y), wmin.x, wmax.x, operator ..), blue+linewidth(.6));
draw((0,0,0) -- (0,0,3), yellow+linewidth(.6));
