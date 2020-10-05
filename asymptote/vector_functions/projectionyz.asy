import graph;

size(200,IgnoreAspect);

real y(real t) {return 1+sin(2pi*t);}
real z(real t) {return t;}

path p=graph(y,z,0,2,operator ..);

draw(p,green,Arrow);

axes("$y$","$z$");
