import three;
import settings;
offline=true;

size(10cm);

defaultrender.merge=true;


currentprojection=perspective(24,-14,33);
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

defaultpen(0.1mm);

triple P = (0,0,0);
triple Q = (1.5, .3, 1.3);
triple R = (.6, 1.7, .7);
triple n = unit(cross((Q-P),(R-P)));

draw(P -- P+n, arrow = Arrow3(), red+0.4mm, L=Label("$\mathbf{n}$", position=EndPoint, align=N));
draw(shift(P)*scale3(0.03)*unitsphere, red);
label("$P$", P, red, align = S);
draw(shift(Q)*scale3(0.02)*unitsphere, black);
label("$Q$", Q, red, align = N);

draw(shift(P)*rotate(-180*acos(n.z)/pi,(n.y,-n.x,0))*shift((-1,-1,0))*scale3(4)*unitplane,
     lightgray+opacity(.5));

draw(P -- Q, arrow = Arrow3(), blue+0.2mm, L=Label("$\mathbf{r} - \mathbf{r}_0$", position=MidPoint, align=N));
draw(P + .1*n -- P + .1*n + .1*unit(Q-P) -- P + .1*unit(Q-P), black+0.1mm);
