#macro Surface ()
    isosurface {
        function {pow(z,2) - pow(y,2) + x}
        threshold 0
        max_gradient 5
        contained_by {box {<-1,-1,-1>, < 1, 1, 1>}}
        open
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
        contained_by {box {<-1.5,-1.5,-1.5>, < 1.5, 1.5, 1.5>}}
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

#macro YCurve (Loc,Color)
    sphere_sweep {
        b_spline
        23,
        #declare Index = -1;
        #while(Index <= 21)

            <pow(.1*Index-1,2)-pow(Loc,2),.1*Index-1,Loc>, .01

            #declare Index = Index + 1;
        #end                          

        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
        no_shadow
    }
#end

#macro ZCurve (Loc,Color)
    sphere_sweep {
        b_spline
        23,
        #declare Index = -1;
        #while(Index <= 21)

            <-pow(.1*Index-1,2)+pow(Loc,2),Loc,.1*Index-1>, .01

            #declare Index = Index + 1;
        #end                          

        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
        no_shadow
    }
#end

// Plane y = kz
#macro YZCurve (Loc,Color)
    sphere_sweep {
        b_spline
        23,
        #declare Index = -1;
        #while(Index <= 21)

            <(1 - pow(Loc,2))*pow(.1*Index-1,2),.1*Index-1,Loc*(.1*Index-1)>, .01

            #declare Index = Index + 1;
        #end                          

        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
        no_shadow
    }
#end

// Plane z = ky
#macro ZYCurve (Loc,Color)
    sphere_sweep {
        b_spline
        23,
        #declare Index = -1;
        #while(Index <= 21)

            <(pow(Loc,2)-1)*pow(.1*Index-1,2),Loc*(.1*Index-1),.1*Index-1>, .01

            #declare Index = Index + 1;
        #end                          

        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
        no_shadow
    }
#end

#macro XCurve (Loc,Color)
    #if(Loc = 0)
        cylinder {
            <0,-1,-1>, <0,1,1>, .01
            texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
            no_shadow
        }
        cylinder {
            <0,1,-1>, <0,-1,1>, .01
            texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
            no_shadow
        }
    #else
        #if(Loc > 0)
            intersection {
                box { <-1,-2,-1>, <1,2,1> }
                sphere_sweep {
                    b_spline
                    23,
                    #declare Index = -1;
                    #while(Index <= 21)

                        <Loc,sqrt(Loc+pow(.1*Index-1,2)),.1*Index-1>, .01

                        #declare Index = Index + 1;
                    #end                          

                    texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
                    no_shadow
                }
            }
            intersection {
                box {<-1,-2,-1>, <1,2,1>}
                sphere_sweep {
                    b_spline
                    23,
                    #declare Index = -1;
                    #while(Index <= 21)

                        <Loc,-sqrt(Loc+pow(.1*Index-1,2)),.1*Index-1>, .01

                        #declare Index = Index + 1;
                    #end                          

                    texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
                    no_shadow
                }
            }
        #else
            intersection {
                box { <-1,-2,-1>, <1,2,1> }
                sphere_sweep {
                    b_spline
                    23,
                    #declare Index = -1;
                    #while(Index <= 21)

                        <Loc,.1*Index-1,sqrt(-Loc+pow(.1*Index-1,2))>, .01

                        #declare Index = Index + 1;
                    #end                          

                    texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
                    no_shadow
                }
            }
            intersection {
                box {<-1,-2,-1>, <1,2,1>}
                sphere_sweep {
                    b_spline
                    23,
                    #declare Index = -1;
                    #while(Index <= 21)

                        <Loc,.1*Index-1,-sqrt(-Loc+pow(.1*Index-1,2))>, .01

                        #declare Index = Index + 1;
                    #end                          

                    texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
                    no_shadow
                }
            }
        #end
    #end
#end

// Axis:

cylinder {<0,-1.5,0>,<0,1.5,0>,.01 texture{pigment {color Black}}}
cylinder {<-1.5,0,0>,<1.5,0,0>,.01 texture{pigment {color Black}}}
cylinder {<0,0,-1.5>,<0,0,1.5>,.01 texture{pigment {color Black}}}

cone {<0,1.5,0>,.03 <0,1.57,0>,0 texture {pigment {color Black}}} 

cone {<1.5,0,0>,.03 <1.57,0,0>,0 texture {pigment {color Black}}} 

cone {<0,0,1.5>,.03 <0,0,1.57>,0 texture {pigment {color Black}}} 

