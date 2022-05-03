import three;
import smoothcontour3;

size(200,200,IgnoreAspect);

currentprojection=perspective((4,2,.5));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

real f(real x, real y, real z) {return x^2 + y^2 + z^2 - 1;}

draw((0,-1.5,0)--(0,1.5,0),red,Arrow3(),L = Label("$y$",1));
draw((-1.5,0,0)--(1.5,0,0),red,Arrow3(),L = Label("$x$",1));
draw((0,0,-1.5)--(0,0,1.5),red,Arrow3(),L = Label("$z$",1));
draw(implicitsurface(f,(-1.5,-1.5,-1.5),(1.5,1.5,1.5),20), opacity(.5));


