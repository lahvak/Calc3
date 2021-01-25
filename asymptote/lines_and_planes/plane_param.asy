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

draw(P -- Q, arrow = Arrow3(), blue + 0.4mm, L=Label("$\mathbf{u}$", position=MidPoint, align=N));
draw(P -- R, arrow = Arrow3(), green + 0.4mm, L=Label("$\mathbf{v}$", position=MidPoint, align=N));
draw(shift(P)*scale3(0.03)*unitsphere, red);
label("$P$", P, red, align = N);
draw(shift(Q)*scale3(0.03)*unitsphere, red);
label("$Q$", Q, red, align = N);
draw(shift(R)*scale3(0.03)*unitsphere, red);
label("$R$", R, red, align = N);

draw(shift(P)*rotate(-180*acos(n.z)/pi,(n.y,-n.x,0))*shift((-2,-2,0))*scale3(6)*unitplane,
     lightgray+opacity(.5));

triple point = P + .5*(Q-P) + 2*(R-P);
draw(shift(point)*scale3(0.03)*unitsphere, black);
label("$\mathbf{r}_0 + \frac{1}{2}\mathbf{u} + 2\mathbf{v}$", point, black, align = N);

draw(P -- (P + .5*(Q-P)), lightgray + 0.1mm);
draw(P -- (P + 2*(R-P)), lightgray + 0.1mm);
draw((P + 2*(R-P)) -- (P + 2*(R-P) + .5*(Q-P)), lightgray + 0.1mm);
draw((P + .5*(Q-P)) -- (P + .5*(Q-P) + 2*(R-P)), lightgray + 0.1mm);
