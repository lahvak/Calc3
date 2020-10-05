import three;
import graph3;

size(200,200,IgnoreAspect);

currentprojection=perspective((4,2,.5));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

real f(pair z) {return z.x**2 + sin(pi*z.y);}

draw((0,-2,0)--(0,2,0),red,Arrow3(),L = Label("$y$",1));
draw((-2,0,0)--(2,0,0),red,Arrow3(),L = Label("$x$",1));
draw((0,0,-1)--(0,0,5),red,Arrow3(),L = Label("$z$",1));
draw(surface(f,(-2,-2),(2,2),nx=50,Spline),blue+opacity(.8));


