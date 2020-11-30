import graph;
size(0,320);
usepackage("amsmath");

filldraw((-pi,-pi/2) -- (pi,-pi/2) -- (pi,pi/2) -- (-pi,pi/2) -- cycle, gray, black+linewidth(1.1));
draw((-pi,0) -- (pi,0), green+linewidth(1.1));
draw((0,-pi/2) -- (0,pi/2), blue+linewidth(1.1));

axes(xlabel="$u$", ylabel="$v$", min = (-3.7,-2.1), max = (3.7, 2.1), arrow=Arrow());
label("$-\pi$", (-pi,0), SW);
label("$\pi$", (pi,0), SE);
label("$-\frac{\pi}{2}$", (0,-pi/2), SW);
label("$\frac{\pi}{2}$", (0,pi/2), NW);
