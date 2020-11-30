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

param2fun mkparamfun(multifun x, multifun y, multifun z) {
    return new triple(pair w) {return (x(w), y(w), z(w));};
}

paramfun uslice(param2fun f, real u){
    return new triple(real v) { return f((u, v));};
}

paramfun vslice(param2fun f, real v){
    return new triple(real u) { return f((u, v));};
}

real fx(pair w) {return 3*sin(w.x)*sin(2*w.y);}
real fy(pair w) {return 3*sin(2*w.x)*sin(w.y)^2;}
real fz(pair w) {return 3*cos(2*w.x)*sin(w.y)^2;}

real vmin = 0;
real vmax = pi/2;

real u0 = -pi/2;
real u1 = pi/2;
real u2 = 3*pi/2;

param2fun f = mkparamfun(fx, fy, fz);

//Surface
//draw(surface(f, (u0,vmin), (u1,vmax), nu=40, nv = 40, 
//usplinetype = new splinetype[] {notaknot, notaknot, monotonic},
//vsplinetype = new splinetype[] {notaknot, notaknot, monotonic}),
//yellow+opacity(.8));
draw(surface(f, (u1,vmin), (u2,vmax), nu=40, nv = 40, 
usplinetype = new splinetype[] {notaknot, notaknot, monotonic},
vsplinetype = new splinetype[] {notaknot, notaknot, monotonic}),
magenta+opacity(.8));

draw((0,0,0) -- (0,0,3), green+linewidth(.6));
