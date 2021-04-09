import three;
import graph3;

size(200,200,IgnoreAspect);

currentprojection=perspective((4,2,.5));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

real f(pair z) {return -(z.x - z.y)**2;}

draw((0,-1,0)--(0,1,0),red,Arrow3(),L = Label("$y$",1));
draw((-1,0,0)--(1,0,0),red,Arrow3(),L = Label("$x$",1));
draw((0,0,-4)--(0,0,1),red,Arrow3(),L = Label("$z$",1));
draw(surface(f,(-1,-1),(1,1),nx=20,Spline),gray+opacity(0.5));
draw((-1,-1,0) -- (1,1,0), blue);


