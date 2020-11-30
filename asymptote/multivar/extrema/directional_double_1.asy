import three;
import graph3;

size(200,200,IgnoreAspect);

currentprojection=perspective((4,2,.5));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

// Second partial derivatives at (0,0):
real dxx = 2.1;
real dxy = .6;
real dyy = 1.2;

real minz = -.3;
real maxz = 2.5;

// This has all the second partial derivatives at (0,0) equal to 0.
// Adding this will not change the second partials at (0,0), but it will
// make it more interesting than just a simple quadratic:
real fuzz(pair z) {return 0.2*(1-cos(6*z.x))*(1-cos(3*z.y))*z.x;}

real f(pair z) {return dxx/2*z.x^2 + dxy*z.x*z.y + dyy/2*z.y^2 + fuzz(z);}

pair boundary_point(real theta){
    real r = 1/max(abs(cos(theta)),abs(sin(theta)));
    return (r*cos(theta), r*sin(theta));
}

typedef real realfun(real);
typedef real multifun(pair);

realfun interp(real a, real b){
    return new real(real t) {return a + t*(b-a);};
}

realfun slice(multifun f, real theta){
    pair bp = boundary_point(theta);
    realfun xfun = interp(0,bp.x);
    realfun yfun = interp(0,bp.y);
    return new real (real t) { return f((xfun(t), yfun(t)));};
}

path3 trace(real f(pair), real theta){
    pair bp = boundary_point(theta);
    realfun xfun = interp(0,bp.x);
    realfun yfun = interp(0,bp.y);
    return graph(xfun,yfun,slice(f,theta),-1,1,operator ..);
}

draw((0,-1,0)--(0,1,0),black,Arrow3(),L = Label("$y$",1));
draw((-1,0,0)--(1,0,0),black,Arrow3(),L = Label("$x$",1));
draw((0,0,minz)--(0,0,maxz),black,Arrow3(),L = Label("$z$",1));
draw(surface(f,(-1,-1),(1,1),nx=20,Spline),gray+opacity(0.6));
draw(trace(f,pi/6), green);
draw(trace(f,pi/3), red);
draw(trace(f,pi/2), blue);
draw(trace(f,2*pi/3), magenta);
draw(trace(f,5*pi/6), yellow);
draw(trace(f,pi), cyan);


