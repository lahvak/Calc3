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

void drawBoxedArrow(triple P0, triple P1, pen C1, string Name, pair l1loc, pair l2loc, pair l3loc) {
    draw(P0 -- P1, arrow = Arrow3(), C1 + 0.3mm);
    draw(box(P0, P1), C1);
    label("$" + Name + "_1$", 
    ((P0.x + P1.x)/2, P0.y + l1loc.x*(P1.y - P0.y), P0.z + l1loc.y*(P1.z + P0.z)),
    C1, align = N);
    label("$" + Name + "_2$", 
    (P0.x + l2loc.x*(P1.x - P0.x), (P0.y + P1.y)/2, P0.z + l2loc.y*(P1.z + P0.z)),
    C1, align = N);
    label("$" + Name + "_3$", 
    (P0.x + l3loc.x*(P1.x - P0.x), P0.y + l3loc.y*(P1.y + P0.y), (P0.z + P1.z)/2),
    C1, align = E);
}

drawBoxedArrow(P0, P1, C1, "a", (1,1), (1,1), (1,1));
drawBoxedArrow(P1, P2, C2, "b", (0,0), (0,0), (0,0));
drawBoxedArrow(P0, P2, C3, "c", (0,1), (1,0), (0,1));
