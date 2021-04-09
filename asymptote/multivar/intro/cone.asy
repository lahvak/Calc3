import solids;
import graph3;

size(200);
currentprojection=orthographic(5,4,2);

revolution upcone=cone(-Z,1,1);
revolution downcone=cone(Z,1,-1);
draw(surface(upcone),green+opacity(.5));
draw(surface(downcone),green+opacity(.5));
draw(shift(Z)*surface(unitcircle), green+opacity(.5));
draw(shift(-Z)*surface(unitcircle), green+opacity(.5));

axes3("$x$", "$y$", "$z$", arrow=Arrow3());

