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

triple u = (.3,1,0);
triple v = (-0.5, 0.7,0);
triple pr = dot(u,v)/(dot(u,u))*u;
triple cross1 = cross(u,v);
triple cross2 = cross(v,u);


draw(surface((0,0,0) -- u -- (u+v) -- v -- cycle), black + opacity(.5));

draw((0,0,0) -- u, arrow = Arrow3(), linewidth(0.5)+green,
     L = Label("$\mathbf{u}$", position = MidPoint), align = S);

draw((0,0,0) -- v, arrow = Arrow3(), linewidth(0.5)+blue,
     L = Label("$\mathbf{v}$", position = MidPoint), align = N);

draw((0,0,0) -- cross1, arrow = Arrow3(), linewidth(0.5)+red,
     L = Label("$\mathbf{u}\times\mathbf{v}$", position = MidPoint), align = E);
draw((0,0,0) -- cross2, arrow = Arrow3(), linewidth(0.5)+magenta,
     L = Label("$\mathbf{v}\times\mathbf{u}$", position = MidPoint), align = W);

draw(arc((0,0,0), 0.25*u, v), linewidth(0.3pt), arrow = Arrow3(TeXHead2));

label(rotate(45,Z)*"$\theta$", position = 0.1(unit(u)+unit(v)), interaction=Embedded);

draw(v--pr, dashed);

label(rotate(-15,Z)*"$\left|\mathbf{v}\right|\sin\theta$", position=0.5(v+pr),
interaction=Embedded, align = N);

//draw(u -- (u+v) -- v, gray);
