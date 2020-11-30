import graph;
size(600,0);
usepackage("amsmath");

filldraw((-pi,0) -- (pi,0) -- (pi,1) -- (-pi,1) -- cycle, gray, black+linewidth(1.1));
draw((-pi,.5) -- (pi,.5), green+linewidth(1.1));
draw((0,0) -- (0,1), blue+linewidth(1.1));

axes(xlabel="$u$", ylabel="$v$", min = (-3.5,-.2), max = (3.5, 1.2), arrow=Arrow());
label("$-\pi$", (-pi,0), S);
label("$\pi$", (pi,0), S);
