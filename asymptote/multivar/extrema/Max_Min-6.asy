import three;
import graph3;

currentprojection=orthographic(12,6,6);
currentlight=(4,4,2);

size (8cm,8cm);

real f (real x, real y)
{
return x*y - x^2;
}

real fz(pair z)
{
return f(z.x, z.y);
}

//triple surf(pair z)
//{
// real u=1.7*z.x*cos(z.y);
// real v=1.7*z.x*sin(z.y);
// return (u,v,f(u,v));
//}

draw(surface(fz,(-2,-2),(2,2),nx=30,Spline),green);

//draw(surface(surf,(0,-pi),(1,pi),nu=30,nv=60),green);
path3 p = (-2,-2,0)--(-2,2,0)--(2,2,0)--(2,-2,0)--cycle;

draw(surface(p), lightgrey+opacity(0.3));

draw(p);

draw((2,-2,0)--(2,-2,f(2,-2)),dashed+blue+1);
draw((-2,2,0)--(-2,2,f(2,-2)),dashed+blue+1);
draw((-1,-2,0)--(-1,-2,f(-1,-2)),dashed+blue+1);
draw((1,2,0)--(1,2,f(1,2)),dashed+blue+1);

dot((2,-2,0),blue+3);
dot((-2,2,0),blue+3);
dot((1,2,0),blue+3);
dot((-1,-2,0),blue+3);
dot((2,-2,f(2,-2)),blue+3);
dot((-2,2,f(-2,2)),blue+3);
dot((1,2,f(1,2)),blue+3);
dot((-1,-2,f(-1,-2)),blue+3);

draw(Label("$y$",1),(0,-3.9,0)--(0,3.9,0),red,Arrow3);
draw(Label("$x$",1),(-3.9,0,0)--(3.9,0,0),red,Arrow3);
draw(Label("$z$",1),(0,0,-8.2)--(0,0,1.2),red,Arrow3);
