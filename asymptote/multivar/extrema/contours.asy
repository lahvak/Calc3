import contour;
import graph3;

size(400,400,IgnoreAspect);

real f(pair z) {return 4 + z.x**4 + z.y**3 -4*z.x**2*z.y;}

real[] all = sequence(new real(int n) {return 4*n - 4;}, 38);
int[] labeled_ind = {0,1,2,3,4,8,16,32};
real[] labeled = all[labeled_ind];
real[] unlabeled = all[complement(labeled_ind, all.length)];
real[] extra = {-6,-5,-3,-2,-1,1,2,3,5,6,7,10};


Label[] Labels;
for(real i : labeled){
    Labels.push(Label((string) i, Relative(unitrand()),(0,0), UnFill(1bp)));
}

draw(contour(f,(-3,-2),(3,4), unlabeled), solid);
draw(contour(f,(-3,-2),(3,4), extra), dashed);
draw(Labels,contour(f,(-3,-2),(3,4), labeled), solid);
