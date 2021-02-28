import math;
import contour;
import graph3;

unitsize(3cm);

real f(pair z) {return z.x**2 + z.y**2 - z.x*z.y;}

real[] all = sequence(new real(int n) {return .25*n - 5;}, 74);
int[] labeled_ind = sequence(new int(int n) {return 4*n;}, 16);
real[] labeled = all[labeled_ind];
real[] unlabeled = all[complement(labeled_ind, all.length)];


picture pic;
Label[] Labels;
for(real i : labeled){
    Labels.push(Label((string) i, Relative(unitrand()),(0,0), UnFill(1bp)));
}
draw(pic, contour(f,(-2,-2),(2,2), unlabeled), solid);
draw(pic, Labels,contour(f,(-2,-2),(2,2), labeled), solid);

int n=360;

for(int i = 0; i < n; ++i){
    add(pic);
    drawline((0,0), (cos(2*pi*i/n), sin(2*pi*i/n)), linewidth(2)+solid+red);
    newpage();
}


