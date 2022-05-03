import contour;

size(200,200);

real f(real x, real y) {return x^2 + y^2;}

draw((0,-1.5)--(0,1.5),red,Arrow(),L = Label("$y$",position=EndPoint,align=NW));
draw((-1.5,0)--(1.5,0),red,Arrow(),L = Label("$x$",position=EndPoint,align=SE));
draw(contour(f,(-1.5,-1.5), (1.5, 1.5),new real[] {1}));
