import three;

size(10cm);

defaultrender.merge=true;

currentprojection=perspective(24,14,13);

defaultpen(0.3mm);

draw(-1X -- 2X, blue, arrow = Arrow3(), L=Label("$x$", position=EndPoint, align=W));
draw(-1Y -- 2Y, green, arrow = Arrow3(), L=Label("$y$", position=EndPoint));
draw(-1Z -- 2Z, red, arrow = Arrow3(), L=Label("$z$", position=EndPoint), align=N);

surface yz = shift(0,-1,-1) * scale3(3) * rotate(90, Z) * rotate(90, X) * unitplane;

draw(yz, green + red, light=nolight);
draw(surface(xscale(.2)*yscale(.1)*"$yz$-plane", yz, .7, .8, 0.0025, bottom=false));

surface xz = shift(-1,0,-1) * scale3(3) * rotate(90, X) * unitplane;

draw(xz, blue + red, light=nolight);
draw(surface(xscale(-.2)*yscale(.1)*"$xz$-plane", xz, .7, .8, -0.0025, bottom=true));

surface xy = shift(-1,-1,0) * scale3(3) * unitplane;

draw(xy, blue + green, light=nolight);
draw(surface(xscale(-.2)*yscale(-.1)*"$xy$-plane", xy, .7, .8, 0.0025, bottom=false));

defaultpen(0.2mm);

draw(box((0, 0, 0), (1.4, 1.2, 1)), gray);

label(Label("$(x,y,z)$", align = N), (1.4, 1.2, 1));

draw(shift(1.4, 1.2, 1)*scale3(0.02)*unitsphere);
draw(shift(0, 1.2, 1)*scale3(0.02)*unitsphere, green + red);
draw(shift(1.4, 0, 1)*scale3(0.02)*unitsphere, blue + red);
draw(shift(1.4, 1.2, 0)*scale3(0.02)*unitsphere, blue + green);
draw(shift(1.4, 0, 0)*scale3(0.02)*unitsphere, blue);
draw(shift(0, 1.2, 0)*scale3(0.02)*unitsphere, green);
draw(shift(0, 0, 1)*scale3(0.02)*unitsphere, red);

draw(surface(xscale(.1)*yscale(.05)*"$(0,y,z)$", yz, .75, .67, 0.0025, bottom=false));
draw(surface(xscale(-.1)*yscale(.05)*"$(x,0,z)$", xz, .81, .67, -0.0025, bottom=true));
draw(surface(xscale(-.1)*yscale(-.05)*"$(x,y,0)$", xy, .83, .73, 0.0025, bottom=false));
