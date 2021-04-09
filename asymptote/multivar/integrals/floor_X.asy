import graph;

size(200,200,IgnoreAspect);

real x(real t) {return 2 + 1.5*cos(t) + 0.1*sin(3*t);}
real y(real t) {return 3 + 2*sin(t) + 0.05*cos(4*t);}

pair curve(real t) {return (x(t), y(t));}

real t0 = 0;
real t1 = 2*pi;

path boundary = graph(x, y, t0, t1, operator ..);

real x0 = 1;
real y0 = 4;

real[] xtimes = times(boundary, x0);
real[] ytimes = times(boundary, (0, y0));
real[] mints = mintimes(boundary);
real[] maxts = maxtimes(boundary);

real miny = point(boundary, xtimes[0]).y;
real maxy = point(boundary, xtimes[1]).y;
real minx = point(boundary, ytimes[0]).x;
real maxx = point(boundary, ytimes[1]).x;

pair mins = min(boundary);
pair maxs = max(boundary);
pair center = (mins + maxs)/2;

pair minxpt = point(boundary, mints[0]);
pair minypt = point(boundary, mints[1]);
pair maxxpt = point(boundary, maxts[0]);
pair maxypt = point(boundary, maxts[1]);

// Features:

bool Floor=true;
bool XSlice=true;
bool YSlice=false;

//Axes
draw((0,0)--(maxs.x+1,0),red,Arrow(),L = Label("$x$",1));
draw((0,0)--(0,maxs.y+1),red,Arrow(),L = Label("$y$",1));

//Floor
if(Floor){
    fill(boundary--cycle, gray+opacity(.5));
    draw(boundary, black);
    draw((mins.x,0)--minxpt, black+dotted);
    draw((maxs.x,0)--maxxpt, black+dotted);
    label("$a$",(mins.x,0), align=S);
    label("$b$",(maxs.x,0), align=S);
    draw((0,mins.y)--minypt, black+dotted);
    draw((0,maxs.y)--maxypt, black+dotted);
    label("$c$",(0,mins.y), align=W);
    label("$d$",(0,maxs.y), align=W);
}

//Traces
if(XSlice){
    draw((x0,miny) -- (x0,maxy), blue+linewidth(.5pt));
    draw((x0,0)--(x0,miny), blue+dotted);
    label("$x$",(x0,0), blue, align=S);
}

if(YSlice){
    draw((minx,y0) -- (maxx,y0), green+linewidth(.5pt));
    draw((0,y0)--(minx,y0), green+dotted);
    label("$y$",(0,y0), green, align=W);
}

