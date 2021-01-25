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
triple v = (-1, 1.2, 1.3);
triple w = (1, -1.2, 1.3);

draw((P - 2*v) -- (P + 3*v), blue + 0.5mm);
draw((P - 2*w) -- (P + 3*w), green + 0.5mm);

