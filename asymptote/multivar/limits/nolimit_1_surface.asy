import three;
import graph3;

size(200,200,IgnoreAspect);

currentprojection=perspective((16,8,2));
//currentprojection=orthographic((4,2,.5));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

triple f(pair z) {
    real r = z.x/max(abs(cos(z.y)),abs(sin(z.y)));
    return (r*cos(z.y), r*sin(z.y), 0.5*sin(2*z.y));
}

draw((0,-2,0)--(0,2,0),red,Arrow3(),L = Label("$y$",1));
draw((-2,0,0)--(2,0,0),red,Arrow3(),L = Label("$x$",1));
draw((0,0,-.6)--(0,0,.6),red,Arrow3(),L = Label("$z$",1));
draw(surface(f,(0,-pi),(2,pi),nu=20,nv=200),blue);


