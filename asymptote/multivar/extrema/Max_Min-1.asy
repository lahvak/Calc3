import three;
import contour;
import graph3;
import smoothcontour3;

size(200,200,IgnoreAspect);

currentprojection=perspective((4,2,.5));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

real f (real x, real y)
{
return x^2*y - x*y^2 + 2;
}

real fmz(real x, real y, real z)
{
return f(x, y) - z;
}

triple surf(pair z)
{
real u=1.7*z.x*cos(z.y);
real v=1.7*z.x*sin(z.y);
return (u,v,f(u,v));
}

//draw(surface(surf,(0,-pi),(1,pi),nu=30,nv=60),green);
draw(implicitsurface(fmz,(-2,-2,-5),(2,2,10)),green);
draw(surface((-2,-2,0)--(-2,2,0)--(2,2,0)--(2,-2,0)--cycle),
lightgrey+opacity(0.3));
draw(Label("$y$",1),(0,-2.3,0)--(0,2.3,0),red,Arrow3);
draw(Label("$x$",1),(-2.3,0,0)--(2.3,0,0),red,Arrow3);
draw(Label("$z$",1),(0,0,-.2)--(0,0,5),red,Arrow3);
guide ga[][] = contour (f, (-2,-2), (2,2), sequence(new real(int n) {return n/5 - 5;},75));
for (guide[] a: ga)
{
for (guide g: a)
{
path p = g;
draw(path3(p),blue+thin());
}
}
