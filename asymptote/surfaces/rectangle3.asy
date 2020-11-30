import graph;
size(0,320);
usepackage("amsmath");

filldraw((-pi,-pi) -- (pi,-pi) -- (pi,pi) -- (-pi,pi) -- cycle, gray, black+linewidth(1.1));
draw((-pi,0) -- (pi,0), green+linewidth(1.1));
draw((0,-pi) -- (0,pi), blue+linewidth(1.1));

axes(xlabel="$u$", ylabel="$v$", min = (-3.7,-3.7), max = (3.7, 3.7), arrow=Arrow());
label("$-\pi$", (-pi,0), SW);
label("$\pi$", (pi,0), SE);
label("$-\pi$", (0,-pi), SW);
label("$\pi$", (0,pi), NW);
