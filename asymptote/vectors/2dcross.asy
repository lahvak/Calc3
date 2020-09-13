import geometry;
size(0,160);
usepackage("amsmath");

pair u = (3,1);
pair v = (0.5, 3.2);
pair proj = dot(u,v)/(dot(u,u))*u;

fill((0,0) -- u -- (u+v) -- v -- cycle, lightgray);

draw((0,0) -- u, arrow = Arrow(), green,
     L = Label("$\mathbf{u}$", position = MidPoint), align = S);

draw((0,0) -- v, arrow = Arrow(), blue,
     L = Label("$\mathbf{v}$", position = MidPoint), align = NW);

draw(arc((0,0), 0.25*u, v), linewidth(0.8pt), arrow = Arrow(TeXHead),
     L = Label("$\theta$", position=MidPoint, align=NE));

draw(v--proj, dashed, L = Label("$\left\lvert\mathbf{v}\right\rvert\sin\theta$",
position=MidPoint, align=E));

draw(u -- (u+v) -- v, gray);

markrightangle(v,proj,u);
