import three;
import graph3;

size(200,200,IgnoreAspect);

currentprojection=perspective((8,4,2));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

real f(pair z) {return cos(pi*z.x)*cos(pi*z.y)*sin(z.x^2+z.y^2);}

draw((0,-2,0)--(0,2,0),red,Arrow3(),L = Label("$y$",1));
draw((-2,0,0)--(2,0,0),red,Arrow3(),L = Label("$x$",1));
draw((0,0,-1)--(0,0,1),red,Arrow3(),L = Label("$z$",1));
draw(surface(f,(-2,-2),(2,2),nx=20,Spline),yellow);


