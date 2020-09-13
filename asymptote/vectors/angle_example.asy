import three;
import settings;
offline=true;
usepackage("bm");

size(10cm);

defaultrender.merge=true;


currentprojection=perspective(24,14,13);
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

defaultpen(0.1mm);

triple P0 = (0,0,0);
triple P1 = (-2,3,1);
triple P2 = (2,1,-1);

pen C1 = green;
pen C2 = blue;

draw(P0 -- P1, arrow = Arrow3(), C1 + 0.3mm, L=Label("$\mathbf{a}$",
    position=MidPoint, align=N));
draw(P0 -- P2, arrow = Arrow3(), C2 + 0.3mm, L=Label("$\mathbf{b}$",
    position=MidPoint, align=W));

draw(arc((0,0,0), 0.25*P1, P2), linewidth(0.8pt), arrow = Arrow3(TeXHead2),
     L = Label("$\theta$", position=MidPoint, align=S));
