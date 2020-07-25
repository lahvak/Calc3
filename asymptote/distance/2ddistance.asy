size(0,160);
usepackage("amsmath");

real x1 = 0;
real y1 = 0;
real h = 4;
real k = 3;

real x2 = x1 + h;
real y2 = y1 + k;

pair P1 = (x1, y1);
pair P2 = (x2, y2);
pair P21 = (x2, y1);
pair P12 = (x1, y2);

draw(P1 -- P21 -- P2 -- P12 -- cycle);
dot(P1, L=Label("$(x_1,y_1)$", align = SW));
dot(P2, L=Label("$(x_2,y_2)$", align = NE));

draw(P1 -- P2, red, 
     L = rotate(degrees(atan2(k,h)))*
     Label("$\sqrt{(x_2-x_1)^2 + (y_2 - y_1)^2}$"),
           align = Relative(W));

path DownBrace(real width = .3){
    return (0,0){down} .. tension .8 .. (.5, -width){down} &
           (.5, -width){up} .. tension .8 .. (1,0){up};
}

draw(shift((0,-.1))*shift(P1)*xscale(h)*DownBrace(), 
     L = Label("$\left\lvert x_2 - x_1\right\rvert$", position = MidPoint), align = S);

draw(shift((.1,0))*shift(P21)*rotate(90)*xscale(k)*DownBrace(), 
     L = Label("$\left\lvert y_2 - y_1\right\rvert$", position = MidPoint), align = E);

