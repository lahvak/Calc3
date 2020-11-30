import three;
import graph3;

size(200,200,IgnoreAspect);

currentprojection=perspective((4,2,.5));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

real f(pair z) {return 4 + z.x**4 + z.y**3 -4*z.x**2*z.y;}

draw((0,-2,0)--(0,4,0),red,Arrow3(),L = Label("$y$",1));
draw((-3,0,0)--(3,0,0),red,Arrow3(),L = Label("$x$",1));
draw((0,0,-7)--(0,0,140),red,Arrow3(),L = Label("$z$",1));
draw(surface(f,(-3,-2),(3,4),nx=20,Spline),blue);


