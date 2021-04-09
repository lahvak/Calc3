import graph;

size(200,200);

draw((0,-2)--(0,2),black,Arrow(),L = Label("$y$",position=EndPoint,align=NW));
draw((-2,0)--(2,0),black,Arrow(),L = Label("$x$",position=EndPoint,align=SE));
fill((0,0)--(2,2)--(-2,2)--cycle, green+opacity(.5));
fill((0,0)--(2,-2)--(-2,-2)--cycle, green+opacity(.5));
draw((-2,-2)--(2,2), green);
draw((2,-2)--(-2,2), green);
