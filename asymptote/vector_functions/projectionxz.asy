import graph;

size(200,IgnoreAspect);

real x(real t) {return 1+cos(2pi*t);}
real z(real t) {return t;}

path p=graph(x,z,0,2,operator ..);

draw(p,blue,Arrow);

axes("$x$","$z$");
