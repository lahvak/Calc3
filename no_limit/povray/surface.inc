#macro Surface1 ()
    poly {
        5 <0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>
        sturm
        clipped_by {box {<-1,-.5,-1>, < 1, .5, 1>}}
        texture {
            pigment {color rgbf<1,0,0,.1>}
            finish {reflection 
                {
                    0
                }
            }
        }
    }
#end

#macro Plane(Loc,fun)
    isosurface {
        function {fun(x,y,z)}
        threshold Loc 
        contained_by {box {<-1,-1,-1>, < 1, 1, 1>}}
        open
        texture {
            pigment {color rgbf<.5,.5,1,.9>}
            finish {reflection 
                {
                    0
                }
            }
        }
    }
#end

#macro ZCurveFull (Loc,Color)
    union {
        sphere_sweep {
            b_spline
            23,
            #declare Index = -1;
            #while(Index <= 21)

                <pow(.1*Index-1,2)*(1 + pow(1 - 4*pow(Loc,2),1/2))/(2*Loc),Loc,.1*Index-1>, .01

                #declare Index = Index + 1;
            #end
        }
        sphere_sweep {
            b_spline
            23,
            #declare Index = -1;
            #while(Index <= 21)

                <pow(.1*Index-1,2)*(1 - pow(1 - 4*pow(Loc,2),1/2))/(2*Loc),Loc,.1*Index-1>, .01

                #declare Index = Index + 1;
            #end
        }

        clipped_by {box {<-1,-.5,-1>, < 1, .5, 1>}}
        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
        no_shadow
    }
#end

#macro ZCurveProgress (Loc,Progress,Color)
    sphere_sweep {
        cubic_spline
        23,
        #declare Coef = (1+pow(1-4*pow(Loc,2),1/2))/(2*Loc);
        #declare Start = 1/pow(Coef,1/2);
        #declare Stop = Start*(1-Progress);
        #declare Step = (Start - Stop)/20;
        #declare Index = -1;
        #while(Index <= 21)
            #declare Pos = Start - Step*Index;
            <pow(Pos,2)*Coef,Loc,Pos>, .01
            #declare Index = Index + 1;
        #end

        clipped_by {box {<-1,-.5,-1>, < 1, .5, 1>}}
        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
        no_shadow
    }
#end

#macro Axes(xmin,xmax,ymin,ymax,zmin,zmax)
    cylinder {<0,ymin,0>,<0,ymax,0>,.01 texture{pigment {color Black}}}
    cylinder {<xmin,0,0>,<xmax,0,0>,.01 texture{pigment {color Black}}}
    cylinder {<0,0,zmin>,<0,0,zmax>,.01 texture{pigment {color Black}}}

    cone {<0,ymax,0>,.03 <0,ymax+.07,0>,0 texture {pigment {color Black}}} 
    cone {<xmax,0,0>,.03 <xmax+.07,0,0>,0 texture {pigment {color Black}}} 
    cone {<0,0,zmax>,.03 <0,0,zmax+.07>,0 texture {pigment {color Black}}} 
#end
