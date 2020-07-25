import three;
import settings;
offline=true;

size(10cm);

defaultrender.merge=true;


currentprojection=perspective(24,14,13);
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

defaultpen(0.1mm);

triple P0 = (0,0,0);
triple P1 = (1, 1.2, 1.3);
triple P100 = (P1.x, 0, 0);
triple P110 = (P1.x, P1.y, 0);

pen C1 = green;
pen C2 = blue;
pen C3 = red;

void drawBoxedArrow(triple P0, triple P1, pen C1, string Name) {
    draw(P0 -- P1, arrow = Arrow3(), C1 + 0.3mm, L=Label("$\mathbf{" + Name + "}$",
    position=MidPoint, align=N));
    draw(box(P0, P1), C1);
}

drawBoxedArrow(P0, P1, black, "a");

draw(P0 -- P100, arrow = Arrow3(), C1 + 0.3mm, L = Label("$a_1\mathbf{i}$",
position=MidPoint, align = N));
draw(P100 -- P110, arrow = Arrow3(), C2 + 0.3mm, L = Label("$a_2\mathbf{j}$",
position=MidPoint, align = N));
draw(P110 -- P1, arrow = Arrow3(), C3 + 0.3mm, L = Label("$a_3\mathbf{k}$",
position=MidPoint, align = E));
