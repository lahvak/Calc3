import graph3;

size3(200);


real x(real t) {return 1+cos(2pi*t);}
real y(real t) {return 1+sin(2pi*t);}
real z(real t) {return t;}

triple r(real t) {return (x(t), y(t), z(t));}

real t = 1.0;

currentprojection=orthographic((4,6,3), target = r(t));

real dt = 0.00001;

triple rp = (r(t+dt) - r(t-dt))/(2*dt);

path3 p=graph(x,y,z,0,2,operator ..);

draw(p,linewidth(.2pt), Arrow3());

draw(r(t) -- (r(t) + rp), red, Arrow3(), L = Label("$\mathbf{r}'(t)$"));

draw((0,0,0) -- r(t), blue, Arrow3(), L = Label("$\mathbf{r}(t)$"));

axes3("$x$","$y$","$z$");
