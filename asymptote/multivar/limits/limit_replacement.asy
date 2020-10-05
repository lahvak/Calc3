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
    return (z.x**3 - z.y**3)/(z.x**2 + z.x*z.y + z.y**2);
}

draw((0,-2,0)--(0,2,0),red,Arrow3(),L = Label("$y$",1));
draw((-2,0,0)--(2,0,0),red,Arrow3(),L = Label("$x$",1));
draw((0,0,-2)--(0,0,2),red,Arrow3(),L = Label("$z$",1));
draw(surface(f,(-2,-2),(2,2),nx=21,ny=21),blue);


