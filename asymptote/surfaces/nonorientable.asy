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

real fx(pair w) {return (3+w.y*sin(w.x/2))*cos(w.x);}
real fy(pair w) {return (3+w.y*sin(w.x/2))*sin(w.x);}
real fz(pair w) {return w.y*cos(w.x/2);}

pair wmin = (-pi,-1);
pair wmax = (pi,1);

real [] useq = sequence(mkseq(wmin.x, wmax.x, 24), 25);
real [] vseq = sequence(mkseq(wmin.y, wmax.y, 3), 4);

real vector_scale = .7;

// Features:

param2fun f = mkparamfun(fx, fy, fz);

triple numdiff(paramfun f, real t, real h = 1e-4){
    return (f(t+h) - f(t-h))/(2*h);
}

//Surface
draw(surface(f, wmin, wmax, nu=30, usplinetype = new splinetype[] {notaknot,
notaknot, monotonic}),gray+opacity(.9));

for(real u : useq){
    paramfun fu = uslice(f, u);
    for(real v : vseq){
        paramfun fv = vslice(f, v);
        triple tanu = numdiff(fu, v);
        triple tanv = numdiff(fv, u);
        triple nvect = unit(cross(tanv, tanu));
        draw(f((u,v)) -- (f((u,v)) + vector_scale * nvect), red+linewidth(.3pt),Arrow3());
    }
}

draw(graph(uslice(f, wmin.x), wmin.y, wmax.y, operator ..), blue+linewidth(.5));
