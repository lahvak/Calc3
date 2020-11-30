import three;
import graph3;

currentprojection=orthographic(6,12,6);
currentlight=(1,1,0.5);

size (8cm,10cm);

real f (real x, real y)
{
return (x^2 + y^2)*exp(y^2 - x^2);
}

real fz(pair z)
{
return f(z.x, z.y);
}

draw(surface(fz,(-3,-1.1),(3,1.1),nx=30,Spline),green);

draw(surface((-3,-1.1,0)--(-3,1.1,0)--(3,1.1,0)--(3,-1.1,0)--cycle),
lightgrey+opacity(0.3));

draw(Label("$y$",1),(0,-2.5,0)--(0,2.5,0),red,Arrow3);
draw(Label("$x$",1),(-3.5,0,0)--(3.5,0,0),red,Arrow3);
draw(Label("$z$",1),(0,0,-0.2)--(0,0,4.2),red,Arrow3);
