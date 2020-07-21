import three;

size(10cm);

defaultrender.merge=true;

currentprojection=perspective(24,14,13);
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

defaultpen(0.1mm);

draw(-1X -- 2X, blue, arrow = Arrow3(), L=Label("$x$", position=EndPoint, align=W));
draw(-1Y -- 2Y, green, arrow = Arrow3(), L=Label("$y$", position=EndPoint));
draw(-1Z -- 2Z, red, arrow = Arrow3(), L=Label("$z$", position=EndPoint));

defaultpen(0.2mm);

draw(box((0, 0, 0), (1.4, 1.8, 1)), gray);

label(Label("$(x,y,z)$", align = N), (1.4, 1.8, 1));
label(Label("$(0,y,z)$", align = E), (0, 1.8, 1), green + red);
label(Label("$(x,0,z)$", align = W), (1.4, 0, 1), blue + red);
label(Label("$(x,y,0)$", align = S), (1.4, 1.8, 0), blue + green);
label(Label("$(x,0,0)$", align = W), (1.4, 0, 0), blue);
label(Label("$(0,y,0)$", align = NE), (0, 1.8, 0), green);
label(Label("$(0,0,z)$", align = NE), (0, 0, 1), red);

draw(shift(1.4, 1.8, 1)*scale3(0.02)*unitsphere);
draw(shift(0, 1.8, 1)*scale3(0.02)*unitsphere, green + red);
draw(shift(1.4, 0, 1)*scale3(0.02)*unitsphere, blue + red);
draw(shift(1.4, 1.8, 0)*scale3(0.02)*unitsphere, blue + green);
draw(shift(1.4, 0, 0)*scale3(0.02)*unitsphere, blue);
draw(shift(0, 1.8, 0)*scale3(0.02)*unitsphere, green);
draw(shift(0, 0, 1)*scale3(0.02)*unitsphere, red);
