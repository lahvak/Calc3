import three;

size(10cm);

defaultrender.merge=true;

currentprojection=perspective(24,14,13);
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

defaultpen(0.1mm);

draw(-.2X -- 3X, black, arrow = Arrow3(), L=Label("$x$", position=EndPoint, align=W));
draw(-.2Y -- 3Y, black, arrow = Arrow3(), L=Label("$y$", position=EndPoint));
draw(-.2Z -- 3Z, black, arrow = Arrow3(), L=Label("$z$", position=EndPoint));

defaultpen(0.2mm);

draw(box((0, 0, 0), (2, 2, 2)), black);

draw(surface((0,0,0) -- (2,0,0) -- (2,2,0) -- (0,2,0) -- cycle), gray + opacity(.3));
draw(surface((0,0,2) -- (2,0,2) -- (2,2,2) -- (0,2,2) -- cycle), gray + opacity(.3));
draw(surface((0,0,0) -- (0,2,0) -- (0,2,2) -- (0,0,2) -- cycle), gray + opacity(.3));
draw(surface((2,0,0) -- (2,2,0) -- (2,2,2) -- (2,0,2) -- cycle), gray + opacity(.3));
draw(surface((0,0,0) -- (2,0,0) -- (2,0,2) -- (0,0,2) -- cycle), gray + opacity(.3));
draw(surface((0,2,0) -- (2,2,0) -- (2,2,2) -- (0,2,2) -- cycle), gray + opacity(.3));

draw(shift(0,0,0)*scale3(0.05)*unitsphere, blue);
draw(shift(2,0,0)*scale3(0.05)*unitsphere, blue);
draw(shift(0,2,0)*scale3(0.05)*unitsphere, blue);
draw(shift(0,0,2)*scale3(0.05)*unitsphere, blue);
draw(shift(2,2,0)*scale3(0.05)*unitsphere, blue);
draw(shift(2,0,2)*scale3(0.05)*unitsphere, blue);
draw(shift(0,2,2)*scale3(0.05)*unitsphere, blue);
draw(shift(2,2,2)*scale3(0.05)*unitsphere, blue);

draw(shift(1,1,1)*scale3(0.05)*unitsphere, red);

draw(shift(1,1,0)*scale3(0.05)*unitsphere, green);
draw(shift(1,1,2)*scale3(0.05)*unitsphere, green);
draw(shift(0.5,0,1)*scale3(0.05)*unitsphere, green);
draw(shift(1.5,2,1)*scale3(0.05)*unitsphere, green);
draw(shift(0,0.5,1)*scale3(0.05)*unitsphere, green);
draw(shift(2,1.5,1)*scale3(0.05)*unitsphere, green);

draw(shift(0,0.5,0)*scale3(0.05)*unitsphere, magenta);
draw(shift(0,0,1)*scale3(0.05)*unitsphere, magenta);
draw(shift(0,0.5,2)*scale3(0.05)*unitsphere, magenta);
draw(shift(0,2,1)*scale3(0.05)*unitsphere, magenta);
draw(shift(2,1.5,0)*scale3(0.05)*unitsphere, magenta);
draw(shift(2,0,1)*scale3(0.05)*unitsphere, magenta);
draw(shift(2,1.5,2)*scale3(0.05)*unitsphere, magenta);
draw(shift(2,2,1)*scale3(0.05)*unitsphere, magenta);
draw(shift(0.5,0,0)*scale3(0.05)*unitsphere, magenta);
draw(shift(0.5,0,2)*scale3(0.05)*unitsphere, magenta);
draw(shift(1.5,2,0)*scale3(0.05)*unitsphere, magenta);
draw(shift(1.5,2,2)*scale3(0.05)*unitsphere, magenta);
