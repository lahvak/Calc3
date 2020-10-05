//Level surfaces of the function f(x,y,z) = 2x^2 + 3y^2 - z^2
import three;
import graph3;

size(200,0);

currentprojection=perspective(10,8,4);

typedef triple paramfcn(pair);

paramfcn Fpos(real k){
    real a = sqrt(abs(k)/2);
    real b = sqrt(abs(k)/3);
    real c = sqrt(abs(k));

    return new triple(pair z) {return (a*cosh(z.x)*cos(z.y),
    b*cosh(z.x)*sin(z.y), c*sinh(z.x));};
}

paramfcn Fneg(real k, bool plus){
    real a = sqrt(abs(k)/2);
    real b = sqrt(abs(k)/3);
    real c = (plus?1:-1)*sqrt(abs(k));

    return new triple(pair z) {return (a*sinh(z.x)*cos(z.y),
    b*sinh(z.x)*sin(z.y), c*cosh(z.x));};
}

triple fcone(pair z){
    return (z.x/sqrt(2)*cos(z.y),z.x/sqrt(3)*sin(z.y),z.x);
}

surface surfpos(real k){
    real ulim = asinh(sqrt(1/k));
    return surface(Fpos(k),(-ulim,pi/4),(ulim,7*pi/4),nu=10, nv=15);
}

surface surfneg(real k, bool plus){
    real ulim = acosh(sqrt(1/k));
    return surface(Fneg(k, plus),(0,pi/4),(ulim,7*pi/4),nu=5, nv=15);
}

surface s1=surfpos(1/2);
surface s2=surfpos(1);

surface s4_p = surfneg(1/2, true);
surface s4_n = surfneg(1/2, false);

surface s0plus = surface(fcone, (0,pi/4), (1,7*pi/4), nu = 5, nv=15);
surface s0minus = surface(fcone, (-1,-3*pi/4), (0,3*pi/4), nu = 5, nv=15);

xaxis3(YZZero(extend=true),red,Arrow3,L=Label("$x$", position=EndPoint, align=W));
yaxis3(XZZero(extend=true),red,Arrow3,L=Label("$y$", position=EndPoint, align=E));
zaxis3(XYZero(extend=true),red,Arrow3,L=Label("$z$", position=EndPoint, align=N));

draw(s1,.5*blue + .5*white + opacity(.5),meshpen=black+thick());
draw(s2,blue + opacity(.5),meshpen=black+thick());

draw(s0plus, gray + opacity(.5), meshpen=black+thick());
draw(s0minus, gray + opacity(.5), meshpen=black+thick());

draw(s4_p,.5*red + .5*white + opacity(.5),meshpen=black+thick());
draw(s4_n,.5*red + .5*white + opacity(.5),meshpen=black+thick());

label("$1$", blue, position=(0,sqrt(2/3),1), align=N);
label("$\frac{1}{2}$", .5*blue + .5*white, position=(0,sqrt(1.5/3),1), align=N);
label("$0$", gray, position=(0,sqrt(1/3),1), align=N);
label("$-\frac{1}{2}$", .5*red + .5*white, position=(0,sqrt(0.5/3),1), align=N);


