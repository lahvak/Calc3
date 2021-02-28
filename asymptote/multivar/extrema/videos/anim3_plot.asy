import graph;

unitsize(3cm);

real f(pair z) {return z.x**2 + z.y**2 + 3*z.x*z.y;}

picture pic;
draw(pic,(0,-2)--(0,2),black,Arrow(),L = Label("$g(t)$",position=EndPoint,align=NW));
draw(pic,(-2,0)--(2,0),black,Arrow(),L = Label("$t$",position=EndPoint,align=SE));

int n=360;

for(int i = 0; i < n; ++i){
    add(pic);
    picture curve;
    real g(real t) {return f(t*(cos(2*pi*i/n), sin(2*pi*i/n)));}
    draw(curve, graph(g,-2,2), linewidth(2)+red);
    clip(curve, (-2,-2)--(2,-2)--(2,2)--(-2,2)--cycle);
    add(curve);
    newpage();
}

