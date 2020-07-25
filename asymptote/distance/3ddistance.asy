import three;
usepackage("amsmath");

size(10cm);

defaultrender.merge=true;

currentprojection=perspective(24,14,13);
currentlight=light(white, specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

defaultpen(0.1mm);

real h = 1.4;
real k = 1.8;
real l = 1;

triple P1 = (0, 0, 0);
triple P2 = (h, k, l);
triple P21 = (h, k, 0);

draw(box(P1, P2), gray);

label(Label("$(x_2,y_2,z_2)$", align = N), P2);
label(Label("$(x_1,y_1,z_1)$", align = S), P1);
label(Label("$(x_2,y_2,z_1)$", align = S), P21);

draw(shift(P1)*scale3(0.02)*unitsphere);
draw(shift(P2)*scale3(0.02)*unitsphere);
draw(shift(P21)*scale3(0.02)*unitsphere);

defaultpen(0.4mm);

label(rotate(degrees(atan2(k,h)), Z)*"$\sqrt{(x_2-x_1)^2 + (y_2 - y_1)^2}$",
(P21 + P1)/2, align = N, red, Embedded);

draw(P1 -- P21, red);

draw(P21 -- P2, green, L = Label("$\left\lvert z_2 - z_1\right\rvert$", position = MidPoint), align = E);

draw(P1 -- P2, blue, L = Label("$d$", position = MidPoint), align = N);
