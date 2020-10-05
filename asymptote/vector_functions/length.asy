import graph3;

size3(200,IgnoreAspect);

currentprojection=orthographic(4,6,3);

real x(real t) {return 1+cos(2pi*t);}
real y(real t) {return 1+sin(2pi*t);}
real z(real t) {return t;}

triple r(real t) {return (x(t), y(t), z(t));}

real a = 0;
real b = 2;

int n = 20;

real dt = (b - a)/n;

int k = 10;

path3 p=graph(x,y,z,a,b,operator ..);

draw(p,linewidth(1pt));

for(int i=0; i < n; ++i){
    draw((r(a+i*dt)) -- (r(a+(i+1)*dt)), red, Arrow3());
}

draw((0,0,0) -- r(a + (k-1)*dt), blue, Arrow3(), L = Label("$\mathbf{r}(t_{k-1})$"), align=NW);
draw((0,0,0) -- r(a + k*dt), blue, Arrow3(), L = Label("$\mathbf{r}(t_{k})$"), align=SE);

axes3("$x$","$y$","$z$");
