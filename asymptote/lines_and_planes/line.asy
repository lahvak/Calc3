import three;
import settings;
offline=true;

size(10cm);

defaultrender.merge=true;


currentprojection=perspective(24,14,13);
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

defaultpen(0.1mm);

triple P = (0,0,0);
triple Q = (-1, 1.2, 1.3);

draw(P -- Q, arrow = Arrow3(), red + 0.4mm, L=Label("$\mathbf{v}$", position=MidPoint, align=N));
draw((P - 2*(Q-P)) -- (P + 3*(Q-P)), black + 0.2mm);
draw(shift(P)*scale3(0.03)*unitsphere, blue);
label("$P$", P, blue, align = N);
label("$t=0$", P, black, align = S);
draw(shift(Q)*scale3(0.03)*unitsphere, blue);
label("$Q$", Q, blue, align = N);
label("$t=1$", Q, black, align = S);
draw(shift(P + 0.66*(Q-P))*scale3(0.025)*unitsphere, black);
label("$t=\frac{2}{3}$", P + 0.66*(Q-P), black, align = S);
draw(shift(P - (Q-P))*scale3(0.025)*unitsphere, black);
label("$t=-1$", P - (Q-P), black, align = S);
draw(shift(P + 2*(Q-P))*scale3(0.025)*unitsphere, black);
label("$t=2$", P + 2*(Q-P), black, align = S);
