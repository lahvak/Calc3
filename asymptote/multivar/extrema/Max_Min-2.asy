import three;
//import contour;
import graph3;

currentprojection=orthographic(6,12,6);
currentlight=(1,1,0.5);

size (8cm,8cm);

real f (real x, real y)
{
return x^3*y - x*y^3 + 2;
}

triple surf(pair z)
{
real u=1.7*z.x*cos(z.y);
real v=1.7*z.x*sin(z.y);
return (u,v,f(u,v));
}

draw(surface(surf,(0,-pi),(1,pi),nu=60,nv=60),green);

draw(surface((-2.5,-2.5,0)--(-2.5,2.5,0)--(2.5,2.5,0)--(2.5,-2.5,0)--cycle),
lightgrey+opacity(0.3));

draw(Label("$y$",1),(0,-2.9,0)--(0,2.9,0),red,Arrow3);
draw(Label("$x$",1),(-2.9,0,0)--(2.9,0,0),red,Arrow3);
draw(Label("$z$",1),(0,0,-.2)--(0,0,5),red,Arrow3);

//
//guide ga[][] = contour (f, (-2.5,-2.5), (2.5,2.5), sequence(new real(int n)
//{return n/5;},25));
//
//for (guide[] a: ga)
//{
//for (guide g: a)
//{
//path p = g;
//draw(path3(p),blue+thin());
//}
//}
