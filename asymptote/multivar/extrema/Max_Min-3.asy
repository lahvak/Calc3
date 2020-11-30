import three;
import contour;
import graph3;

currentprojection=orthographic(6,12,6);
currentlight=(1,1,0.5);

size (8cm,8cm);

real f (real x, real y)
{
return (x^7*y - 7*x^5*y^3 + 7*x^3*y^5 - x*y^7 + 3)/3;
}

real fz(pair z)
{
return f(z.x, z.y);
}

triple surf(pair z)
{
real u=1.5*z.x*cos(z.y);
real v=1.5*z.x*sin(z.y);
return (u,v,f(u,v));
}

//draw(surface(fz,(-1,-1),(1,1),nx=30,Spline,new bool(pair z) {return fz(z)<3;}),green);

draw(surface(surf,(0,-pi),(1,pi),nu=30,nv=120),green);

draw(surface((-2,-2,0)--(-2,2,0)--(2,2,0)--(2,-2,0)--cycle),
lightgrey+opacity(0.3));

draw(Label("$y$",1),(0,-2.1,0)--(0,2.1,0),red,Arrow3);
draw(Label("$x$",1),(-2.1,0,0)--(2.1,0,0),red,Arrow3);
draw(Label("$z$",1),(0,0,-.2)--(0,0,3),red,Arrow3);


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
