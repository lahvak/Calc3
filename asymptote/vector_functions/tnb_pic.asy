import graph3;

size3(500);


real x(real t) {return (2+cos(1.5*t))*cos(t);}
real y(real t) {return (2+cos(1.5*t))*sin(t);}
real z(real t) {return sin(1.5*t);}

triple r(real t) {return (x(t), y(t), z(t));}

currentprojection=orthographic((4,6,3), target = (0,0,0));

real dt = 0.00001;

triple rp(real t) {return (r(t+dt) - r(t-dt))/(2*dt);}

triple T(real t) {
    triple diff = rp(t);
    return unit(diff);
}

triple Tp(real t) {return (T(t+dt) - T(t-dt))/(2*dt);}

triple N(real t) {
    triple diff = Tp(t);
    return unit(diff);
}

triple B(real t) {
    triple tvec = T(t);
    triple nvec = N(t);
    return cross(tvec,nvec);
}

path3 p=graph(x,y,z,0,4*pi,operator ..);

draw(p,linewidth(.8pt), Arrow3());

real t = 0.5;

draw(r(t) -- (r(t) + T(t)), red, Arrow3(), L = Label("$T(t)$"));
draw(r(t) -- (r(t) + N(t)), green, Arrow3(), L = Label("$N(t)$"));
draw(r(t) -- (r(t) + B(t)), blue, Arrow3(), L = Label("$B(t)$"));

t = 2.0;

draw(r(t) -- (r(t) + T(t)), red, Arrow3(), L = Label("$T(t)$"));
draw(r(t) -- (r(t) + N(t)), green, Arrow3(), L = Label("$N(t)$"));
draw(r(t) -- (r(t) + B(t)), blue, Arrow3(), L = Label("$B(t)$"));

t = 5.0;

draw(r(t) -- (r(t) + T(t)), red, Arrow3(), L = Label("$T(t)$"));
draw(r(t) -- (r(t) + N(t)), green, Arrow3(), L = Label("$N(t)$"));
draw(r(t) -- (r(t) + B(t)), blue, Arrow3(), L = Label("$B(t)$"));

t = 8.0;

draw(r(t) -- (r(t) + T(t)), red, Arrow3(), L = Label("$T(t)$"));
draw(r(t) -- (r(t) + N(t)), green, Arrow3(), L = Label("$N(t)$"));
draw(r(t) -- (r(t) + B(t)), blue, Arrow3(), L = Label("$B(t)$"));

t = 10.0;

draw(r(t) -- (r(t) + T(t)), red, Arrow3(), L = Label("$T(t)$"));
draw(r(t) -- (r(t) + N(t)), green, Arrow3(), L = Label("$N(t)$"));
draw(r(t) -- (r(t) + B(t)), blue, Arrow3(), L = Label("$B(t)$"));

axes3("$x$","$y$","$z$", yellow);
