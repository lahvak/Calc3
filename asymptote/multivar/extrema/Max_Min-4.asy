import three;
import graph3;

currentprojection=orthographic(6,12,6);
currentlight=(1,1,0.5);

size (5cm,7cm);

real f (real x, real y)
{
return exp(x)*cos(y);
}

real fz(pair z)
{
return f(z.x, z.y);
}

draw(surface(fz,(-6,-2*pi),(2,2*pi),nx=30,Spline),green);

draw(surface((-6,-2*pi,0)--(-6,2*pi,0)--(2,2*pi,0)--(2,-2*pi,0)--cycle),
lightgrey+opacity(0.3));

draw(Label("$y$",1),(0,-6.9,0)--(0,6.9,0),red,Arrow3);
draw(Label("$x$",1),(-6.5,0,0)--(3.5,0,0),red,Arrow3);
draw(Label("$z$",1),(0,0,-6.2)--(0,0,6.2),red,Arrow3);

for (int k=-3; k<4; k=k+2)
{
draw((-6,k*pi/2,0)--(2,k*pi/2,0),blue+1);
}

for (int k=-2; k<3; ++k)
{
real y=k*pi;
draw(graph(new real(real p) {return p;}, new real(real p) {return y;}, new
real(real p) {return f(p,y);}, -6, 2, operator ..), yellow+1);
}
