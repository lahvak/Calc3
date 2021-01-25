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
triple u = Q - P;
triple v = R - P;

draw(P -- Q, arrow = Arrow3(), blue + 0.2mm, L=Label("$\mathbf{u}$", position=MidPoint, align=N));
draw(P -- R, arrow = Arrow3(), green + 0.2mm, L=Label("$\mathbf{v}$", position=MidPoint, align=N));

draw(surface(P - 2.05*u - 2.05*v -- P - 2.05*u + 3.05*v -- P + 3.05*u + 3.05*v -- P + 3.05*u - 2.05*v -- cycle),
     lightgray+opacity(.5));

draw(P - 2.05*v -- P + 3.05*v, black + .1mm);
draw(P - 2.05*u -- P + 3.05*u, black + .1mm);

for(int i = -2; i <= 3; ++i){
    if(i != 0) {
        draw(P + i*u - 2.05*v -- P + i*u + 3.05*v, heavygray + .05mm);
        draw(P + i*v - 2.05*u -- P + i*v + 3.05*u, heavygray + .05mm);
    }
}

for(int i = -2; i < 3; ++i){
    for(int j = 1; j <= 9; ++j){
        draw(P + (i+.1*j)*u - 2.05*v -- P + (i+.1*j)*u + 3.05*v, lightgray + .02mm);
        draw(P + (i+.1*j)*v - 2.05*u -- P + (i+.1*j)*v + 3.05*u, lightgray + .02mm);
    }
}
