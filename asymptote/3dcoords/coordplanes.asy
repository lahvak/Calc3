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

surface xz = shift(-1,-1,0) * scale3(3) * unitplane;

draw(xz, blue + green, light=nolight);
draw(surface(xscale(-.2)*yscale(-.1)*"$xy$-plane", xz, .7, .8, 0.0025, bottom=false));
