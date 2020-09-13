import geometry;
size(0,160);
usepackage("amsmath");

pair u = (3,1);
pair v = (1.5, 3.2);
pair proj = dot(u,v)/(dot(u,u))*u;
pair uperp = (-u.y, u.x);

draw((0,0) -- u, arrow = Arrow(), green,
     L = Label("$\mathbf{u}$", position = MidPoint), align = S);

draw((0,0) -- v, arrow = Arrow(), blue,
     L = Label("$\mathbf{v}$", position = MidPoint), align = NW);

draw(arc((0,0), 0.25*u, v), linewidth(0.8pt), arrow = Arrow(TeXHead),
     L = Label("$\theta$", position=MidPoint, align=NE));

draw((0,0) -- uperp, arrow = Arrow(), red,
    L = Label("$\mathbf{u}^\perp$", position = MidPoint, align = W));

draw(arc((0,0), 0.25*v, uperp), linewidth(0.8pt), arrow = Arrow(TeXHead),
     L = Label("$\frac{\pi}{2} - \theta$", position=MidPoint, align=N));
