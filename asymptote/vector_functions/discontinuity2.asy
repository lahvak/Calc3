import graph3;

size3(200,IgnoreAspect);

currentprojection=orthographic(4,6,3);

real x(real t) {return 2*t;}
real y(real t) {return (t+1)/((t-1)**2);}
real z(real t) {return 1/(t-1);}

path3 pleft=graph(x,y,z,-2,.95,operator ..);
path3 pright=graph(x,y,z,1.05,4,operator ..);

draw(pleft,red,Arrow3, L=Label("$t < 1$"));
draw(pright,blue,Arrow3, L=Label("$t > 1$"));

axes3("$x$","$y$","$z$");
