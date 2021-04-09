import graph;

size(200,200,IgnoreAspect);

real x(real t) {return 0.5 + 1.7*(0.8*(sin(1.7*t))^2 + t/3);}
real y(real t) {return 1 + 0.4*t^2;}
real invy(real y) {return sqrt((y-1)/0.4);}

real t0 = 0;
real t1 = pi;

pair curve(real t) {return (x(t), y(t));}

path xycurve = graph(x, y, t0, t1, operator ..);

pair xymins = min(xycurve);
pair xymaxs = max(xycurve);

pair mins = (xymins.x-1,xymins.y-1);
pair maxs = (xymaxs.x+1,xymaxs.y+1);

real locmaxtime1 = dirtime(xycurve,(0,1));
pair locmaxpt1 = point(xycurve,locmaxtime1);
path xpath1 = subpath(xycurve,locmaxtime1+.01, length(xycurve));
real locmintime1 = dirtime(xpath1,(0,1));
pair locminpt1 = point(xpath1,locmintime1);
path xpath2 = subpath(xpath1,locmintime1+.01, length(xycurve));
real locmaxtime2 = dirtime(xpath2,(0,1));
pair locmaxpt2 = point(xpath2,locmaxtime2);

real tl1 = invy(locmaxpt1.y);
real tl2 = invy(locminpt1.y);
real tl3 = invy(locmaxpt2.y);

//Axes
draw((mins.x-1,0)--(maxs.x,0),gray,Arrow(),L = Label("$x$",1));
draw((0,mins.y-1)--(0,maxs.y),gray,Arrow(),L = Label("$y$",1));

//Curve
draw(graph(curve,t0,tl1,operator ..), blue, MidArrow(SimpleHead, arrowsize()/2));
draw(graph(curve,tl1,tl2,operator ..), red, MidArrow(SimpleHead, arrowsize()/2));
draw(graph(curve,tl2,tl3,operator ..), blue, MidArrow(SimpleHead, arrowsize()/2));
draw(graph(curve,tl3,t1,operator ..), red, MidArrow(SimpleHead, arrowsize()/2));
label("$\mathbf{r}(a)$",curve(t0), align=SW);
label("$\mathbf{r}(b)$",curve(t1), align=NE);

draw((x(t0),0) -- curve(t0), dashed);
draw((x(t1),0) -- curve(t1), dashed);
draw((x(tl1),0) -- curve(tl1), dashed);
draw((x(tl2),0) -- curve(tl2), dashed);
draw((x(tl3),0) -- curve(tl3), dashed);

