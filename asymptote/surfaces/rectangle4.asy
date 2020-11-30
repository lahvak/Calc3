import graph;
size(0,320);
usepackage("amsmath");

filldraw((0,-pi) -- (3*pi,-pi) -- (3*pi,pi) -- (0,pi) -- cycle, gray, black+linewidth(1.1));
draw((0,0) -- (3*pi,0), green+linewidth(1.1));
draw((1.5*pi,-pi) -- (1.5*pi,pi), blue+linewidth(1.1));

axes(xlabel="$u$", ylabel="$v$", min = (-.3,-3.7), max = (10.2, 3.7), arrow=Arrow());
label("$3\pi$", (3*pi,0), SE);
label("$-\pi$", (0,-pi), SW);
label("$\pi$", (0,pi), NW);
