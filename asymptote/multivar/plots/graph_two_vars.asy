import three;
import graph3;

size(200,200,IgnoreAspect);

currentprojection=perspective((4,2,3));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

real f(pair z) {return 2-z.y^2-z.x^2;}

//surface(f,(-1,-1),(0,1),nx=10);
draw((0,0,0)--(0,2,0),red,Arrow3(),L = Label("$y$",1));
draw((0,0,0)--(2,0,0),red,Arrow3(),L = Label("$x$",1));
draw((0,0,0)--(0,0,2.5),red,Arrow3(),L = Label("$z$",1));
//draw((.8,.6,0)--(.8,.6,2-2*.6^2),black,L = Label("$(x,y)$",0));
draw((.8,0,0)--(.8,.6,0), black+dashed);
draw((0,.6,0)--(.8,.6,0), black+dashed);
draw(surface(f,(0,-1),(1,1),nx=10,Spline),gray+opacity(.5));
draw((.8,.6,0)--(.8,.6,f((.8,.6))),black + dotted,L = Label("$(x,y,f(x,y))$",position=EndPoint,align=NE));
draw((.8,.6,f((.8,.6)))--(0,0,f((.8,.6))),black + dotted,L = Label("$f(x,y)$",position=EndPoint,align=W));
dot((.8,.6,0));
label("$(x,y)$", (.8, .6, 0), align=S);
dot((.8,.6,f((.8, .6))));
dot((0,0,f((.8, .6))));


