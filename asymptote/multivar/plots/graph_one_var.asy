import graph;

size(200,200);

real f(real x) {return .5*(3-(x-.2)^2);}

draw((0,0)--(0,2),red,Arrow(),L = Label("$y$",position=EndPoint,align=NW));
draw((0,0)--(2,0),red,Arrow(),L = Label("$x$",position=EndPoint,align=SE));
draw(graph(f,0,2),gray);
draw((.8,0)--(.8,f(.8)),black + dotted,L = Label("$(x,f(x))$",position=EndPoint,align=NE));
draw((.8,f(.8))--(0,f(.8)),black + dotted,L = Label("$f(x)$",position=EndPoint,align=W));
dot((.8,0));
label("$x$", (.8, 0), align=S);
dot((.8,f(.8)));
dot((0,f(.8)));


