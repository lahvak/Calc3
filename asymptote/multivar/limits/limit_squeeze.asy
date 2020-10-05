import three;
import graph3;

size(200,200,IgnoreAspect);

currentprojection=perspective((16,8,2));
//currentprojection=orthographic((4,2,.5));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

real f(pair z) {
    if (z.x == 0 && z.y == 0) {
        return 0;
    }
    return z.x*z.y/hypot(z.x,z.y);
}

draw((0,-2,0)--(0,2,0),red,Arrow3(),L = Label("$y$",1));
draw((-2,0,0)--(2,0,0),red,Arrow3(),L = Label("$x$",1));
draw((0,0,-2)--(0,0,2),red,Arrow3(),L = Label("$z$",1));
draw(surface(f,(-2,-2),(2,2),nx=41,ny=41),blue);
draw(surface((2,0,0)--(2,2,2)--(-2,2,2)--(-2,0,0)--cycle), green+opacity(.3));
draw(surface((2,0,0)--(2,-2,2)--(-2,-2,2)--(-2,0,0)--cycle), green+opacity(.3));
draw(surface((2,0,0)--(2,2,-2)--(-2,2,-2)--(-2,0,0)--cycle), magenta+opacity(.3));
draw(surface((2,0,0)--(2,-2,-2)--(-2,-2,-2)--(-2,0,0)--cycle), magenta+opacity(.3));


