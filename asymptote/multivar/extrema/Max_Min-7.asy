import three;
import graph3;

currentprojection=orthographic(12,6,6);
currentlight=(1,1,0.5);

size (8cm,8cm);

real f (real x, real y)
{
return (2x^3 + y^4);
}

real fz(pair z)
{
return f(z.x, z.y);
}

triple surf(pair z)
{
real u=z.x*cos(z.y);
real v=z.x*sin(z.y);
return (u,v,f(u,v));
}

//draw(surface(fz,(-2,-2),(2,2),nx=30,Spline),green);

draw(surface(surf,(0,-pi),(1,pi),nu=30,nv=60),green);
path3 p = (1,0,0)..(0,1,0)..(-1,0,0)..(0,-1,0)..cycle;

draw(surface(p), lightgrey+opacity(0.3));

draw(p);

void vertmark (real x, real y)
{
draw((x,y,0)--(x,y,f(x,y)),dashed+blue+1);
dot((x,y,0),blue+3);
dot((x,y,f(x,y)),blue+3);
}

dot((0,0,0),blue+3);

vertmark (1,0);
vertmark (-1,0);
vertmark (0,1);
vertmark (0,-1);
vertmark (.5,sqrt(3)/2);
vertmark (.5,-sqrt(3)/2);

draw(Label("$y$",1),(0,-1.5,0)--(0,1.5,0),red,Arrow3);
draw(Label("$x$",1),(-1.5,0,0)--(1.5,0,0),red,Arrow3);
draw(Label("$z$",1),(0,0,-2.2)--(0,0,2.2),red,Arrow3);
