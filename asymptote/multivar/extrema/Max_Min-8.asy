import contour;

size(8cm);

real f(pair z) {return 2*z.x^3 + z.y^4;}

draw(contour(f, (-1.2,-1.2),(1.2,1.2), sequence(new real(int n){return n/5 -
5;},50),nx=200),sequence(new pen(int n){return sqrt(n/50)*yellow+sqrt(1-n/50)*red;},50));

draw(N..E..S..W..cycle, blue);

dot(Label("$(1,0)$",black),N,NE,red);
dot(Label("$(-1,0)$",black),S,SE,red);
dot(Label("$(0,1)$", black),E,E,red);
dot(Label("$(-1,0)$", black),W,W,red);
dot(Label("$\left(\frac{1}{2},\frac{\sqrt{3}}{2}\right)$",black),(.5, .5*sqrt(3)),NE, red);
dot(Label("$\left(\frac{1}{2},-\frac{\sqrt{3}}{2}\right)$",black),(.5, -.5*sqrt(3)),SE, red);
