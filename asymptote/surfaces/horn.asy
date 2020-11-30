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

real fx(pair w) {return w.x*(3 - cos(w.y))*cos(w.x);}
real fy(pair w) {return w.x*(3 - cos(w.y))*sin(w.x);}
real fz(pair w) {return w.x*sin(w.y) + 6*pi - 2*w.x;}

pair wmin = (0,-pi);
pair wmax = (3*pi,pi);

param2fun f = mkparamfun(fx, fy, fz);

//Surface
draw(surface(f, wmin, wmax, nu=60, nv=20,
usplinetype = new splinetype[] {notaknot, notaknot, monotonic},
vsplinetype = new splinetype[] {notaknot, notaknot, monotonic}),
gray+opacity(.8));

draw(graph(vslice(f,0), wmin.x, wmax.x, operator ..), green+linewidth(.6));
draw(graph(uslice(f,1.5*pi), wmin.y, wmax.y, operator ..), blue+linewidth(.6));

axes3("$x$","$y$","$z$", extend=true, arrow=Arrow3());
