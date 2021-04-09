import three;
import settings;
offline=true;

size(10cm);

defaultrender.merge=true;


currentprojection=perspective(24,-14,33);
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

defaultpen(0.1mm);

triple n1 = (2,-3,1);
triple n2 = (3,-2,3);
triple un1 = unit(n1);
triple un2 = unit(n2);
triple v = 4*cross(un1, un2);

triple P = (0,0,0);

draw(P -- P+n1, arrow = Arrow3(), red+0.4mm, L=Label("$\mathbf{n_1}$", position=EndPoint, align=N));
draw(P -- P+n2, arrow = Arrow3(), red+0.4mm, L=Label("$\mathbf{n_2}$", position=EndPoint, align=N));
draw(shift(P)*scale3(0.05)*unitsphere, red);
label("$P$", P, red, align = S);

draw(shift(P)*rotate(-180*acos(un1.z)/pi,(un1.y,-un1.x,0))*shift((-4,-4,0))*scale3(8)*unitplane,
     lightgreen+opacity(.1));
draw(shift(P)*rotate(-180*acos(un2.z)/pi,(un2.y,-un2.x,0))*shift((-4,-4,0))*scale3(8)*unitplane,
     lightblue+opacity(.1));

draw(P -- P+v, arrow = Arrow3(), blue+0.4mm, L=Label("$\mathbf{v}$", position=MidPoint, align=S));
draw(P - 2*v -- P + 2*v, black+0.2mm);
