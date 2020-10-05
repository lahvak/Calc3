import graph;

size(200,IgnoreAspect);

real x(real t) {return 1+cos(2pi*t);}
real y(real t) {return 1+sin(2pi*t);}

path p=graph(x,y,0,2,operator ..);

draw(p,red,Arrow);

axes("$x$","$y$");
