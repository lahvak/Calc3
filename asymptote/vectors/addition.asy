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
triple P1 = (1, 1.2, 1.3);
triple P2 = (2.3, 1.5, 2.1);

pen C1 = green;
pen C2 = blue;
pen C3 = red;

void drawArrow(triple P0, triple P1, pen C1, string Name) {
    draw(P0 -- P1, arrow = Arrow3(), C1 + 0.3mm, L=Label("$\mathbf{" + Name + "}$",
    position=MidPoint, align=N));
}

drawArrow(P0, P1, C1, "a");
drawArrow(P1, P2, C2, "b");
drawArrow(P0, P2, C3, "c");
