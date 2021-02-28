import three;
import graph3;

size(300,300,IgnoreAspect);
unitsize(1cm);

currentprojection=perspective((4,2,.5));
currentlight=light(gray(0.5),specularfactor=3,
                   (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));

real f(pair z) {return 0.3*(z.x**2 + z.x*z.y + z.y**2);}

pair boundary_point(real theta){
    real r = 1/max(abs(cos(theta)),abs(sin(theta)));
    return (r*cos(theta), r*sin(theta));
}

real minz = -1;
real maxz = 4;

typedef real realfun(real);
typedef real multifun(pair);

realfun interp(real a, real b){
    return new real(real t) {return a + t*(b-a);};
}

realfun slice(multifun f, real theta){
    pair bp = boundary_point(theta);
    realfun xfun = interp(0,bp.x);
    realfun yfun = interp(0,bp.y);
    return new real (real t) { return f((xfun(t), yfun(t)));};
}

path3 trace(real f(pair), real theta){
    pair bp = boundary_point(theta);
    realfun xfun = interp(0,bp.x);
    realfun yfun = interp(0,bp.y);
    return graph(xfun,yfun,slice(f,theta),-2,2,operator ..);
}

picture pic;
draw(pic,(0,-2,0)--(0,2,0),black,Arrow3(),L = Label("$y$",1,align=E));
draw(pic,(-2,0,0)--(2,0,0),black,Arrow3(),L = Label("$x$",1,align=W));
draw(pic,(0,0,minz)--(0,0,maxz),black,Arrow3(),L = Label("$z$",1,align=N));
draw(pic,surface(f,(-2,-2),(2,2),nx=20,Spline),gray+opacity(0.6));

int n=360;

for(int i = 0; i < n; ++i){
    currentpicture = new picture;
    size(300,300,IgnoreAspect);
    unitsize(1cm);

    currentprojection=perspective((4,2,.5));
    currentlight=light(gray(0.5),specularfactor=3,
                       (0.5,-0.5,-0.25),(0.5,0.5,0.25),(0.5,0.5,1),(-0.5,-0.5,-1));
    add(pic);
    draw(trace(f,2*pi*i/n), linewidth(1)+red);
    shipout(format("anim_surface-%.3d.png", i));
}

