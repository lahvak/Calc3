import graph;

size(200,200,IgnoreAspect);


real f(pair z) {return 6 + 0.7*(z.x - 3)^3 - 0.7*(z.x - 3);}

real flatf(real x) {return f((x,0));}

real t0 = 1;
real t1 = 5;

pair mins = (t0-1,-1);
pair maxs = (t1+1,13);

draw((mins.x-1,0)--(maxs.x+1,0),red,Arrow(),L = Label("$x$",1));
draw((0,mins.y)--(0,maxs.y),red,Arrow(),L = Label("$y$",1));

path graphf = graph(flatf, t0, t1, operator ..);

draw((t0,0) -- graphf -- (t1,0) -- cycle, green);
fill((t0,0) -- graphf -- (t1,0) -- cycle, green+opacity(.5));
label("$a$", (t0,0), S);
label("$b$", (t1,0), S);

label("$\displaystyle\int_a^b f(x)\;dx$", ((t0+t1)/2, maxs.y/4));
