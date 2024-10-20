//#declare FUNC = function(x,y){pow(x,2) - pow(y,2)}
//#declare FUNC = function(x,y){x*y}
#declare FUNC = function(x,y){-pow(x,2) - 3*x*y - pow(y,2)}

#declare ZMin = FUNC(1,-1);
#declare ZMax = FUNC(1,1);

#declare PARTIALX = function(x,y,h){(FUNC(x+h,y) - FUNC(x-h,y))/(2*h)}
#declare PARTIALY = function(x,y,h){(FUNC(x,y+h) - FUNC(x,y-h))/(2*h)}

#declare RasterScale = .1;
#declare RasterHalfLine  = 0.02;
#declare RasterHalfLineY = 0.02;

#macro Raster(RScale, HLine,Dir)
       pigment{ gradient Dir scale RScale
                color_map{[0.000   color rgbt<0,0,1,0>*0.8]
                          [0+HLine color rgbt<0,0,1,0>*0.8]
                          [0+HLine color rgbt<1,1,1,1>]
                          [1-HLine color rgbt<1,1,1,1>]
                          [1-HLine color rgbt<0,0,1,0>*0.8]
                          [1.000   color rgbt<0,0,1,0>*0.8]} }
       finish { ambient 0.15 diffuse 0.85}
 #end// of Raster(RScale, HLine)-macro

#macro SurfaceX (Loc, Color)
    parametric {
        function { u }
        function { v }
        function { FUNC(u,v) }
        <-1,-1>, <Loc,1>
        contained_by{box{<-1,-1,ZMin>, <1,1,ZMax>}}
        texture {
            pigment {color Color filter .5}
            finish {
                ambient 0
                diffuse .7
                reflection 0
                specular .5
                roughness .05
            }
        }
        interior_texture {
            pigment {color Color filter .5}
            finish {
                ambient 0
                diffuse .7
                reflection 0
                specular .5
                roughness .05
            }
        }
    }
    parametric {
        function { u }
        function { v }
        function { FUNC(u,v) }
        <Loc,-1>, <1,1>
        contained_by {box{<-1,-1,ZMin>, <1,1,ZMax>}}
        texture {
            pigment {color Color filter .95}
            finish {
                ambient 0
                diffuse 0
                reflection .35
                specular 1
                roughness .001
            }
        }
        interior_texture {
            pigment {color Color filter .95}
            finish {
                ambient 0
                diffuse 0
                reflection .35
                specular 1
                roughness .001
            }
        }
    }
#end

#macro SurfaceY (Loc, Color)
    parametric {
        function { u }
        function { v }
        function { FUNC(u,v) }
        <-1,-1>, <1,Loc>
        contained_by {box{<-1,-1,ZMin>, <1,1,ZMax>}}
        texture {
            pigment {color Color filter .5}
            finish {
                ambient 0
                diffuse .7
                reflection 0
                specular .5
                roughness .05
            }
        }
        interior_texture {
            pigment {color Color filter .5}
            finish {
                ambient 0
                diffuse .7
                reflection 0
                specular .5
                roughness .05
            }
        }
    }
    parametric {
        function { u }
        function { v }
        function { FUNC(u,v) }
        <-1,Loc>, <1,1>
        contained_by {box{<-1,-1,ZMin>, <1,1,ZMax>}}
        texture {
            pigment {color Color filter .95}
            finish {
                ambient 0
                diffuse 0
                reflection .35
                specular 1
                roughness .001
            }
        }
        interior_texture {
            pigment {color Color filter .95}
            finish {
                ambient 0
                diffuse 0
                reflection .35
                specular 1
                roughness .001
            }
        }
    }
#end

#macro Plane(Vec,Loc)
    plane {
        Vec, Loc
        clipped_by{
            box {<-1,-1,ZMin>, <1,1,ZMax>}
        }
        texture {
            pigment {color rgbf<1,1,.8,.4>}
            finish {
                ambient 0.1
                diffuse 0.6
            }
        }
        texture { Raster(RasterScale,RasterHalfLine,vrotate(Vec,<0,0,90>)) rotate<0,0,0> }
        texture { Raster(RasterScale,RasterHalfLineY,vrotate(Vec,<0,0,90>)) rotate 90*Vec}
    }
#end

#macro XCurve (Loc,Color)
    union {
        sphere_sweep {
            b_spline
            23,
            #declare Index = -1;
            #while(Index <= 21)

                <Loc,.1*Index-1,FUNC(Loc,.1*Index-1)>, .01

                #declare Index = Index + 1;
            #end
        }
        sphere {<Loc,-1,FUNC(Loc,-1)>, .01}
        sphere {<Loc,1,FUNC(Loc,1)>, .01}

        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
        //no_shadow
    }
#end

#macro YCurve (Loc,Color)
    union {
        sphere_sweep {
            b_spline
            23,
            #declare Index = -1;
            #while(Index <= 21)

                <.1*Index-1,Loc,FUNC(.1*Index-1,Loc)>, .01

                #declare Index = Index + 1;
            #end
        }
        sphere {<-1,Loc,FUNC(-1,Loc)>, .01}
        sphere {<1,Loc,FUNC(1,Loc)>, .01}

        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
        //no_shadow
    }
#end

#macro XVector(xval,yval,Scale,Color)

    union{
        sphere{<xval,yval,FUNC(xval,yval)>, .02}
        cylinder{
            <xval,yval,FUNC(xval,yval)>,
            <xval,yval,FUNC(xval,yval)> + .8*Scale*<0,1,PARTIALY(xval,yval,0.0001)>,
            .01
        }
        cone{
            <xval,yval,FUNC(xval,yval)> + .8*Scale*<0,1,PARTIALY(xval,yval,0.0001)>, .03
            <xval,yval,FUNC(xval,yval)> + Scale*<0,1,PARTIALY(xval,yval,0.0001)>, 0
        }

        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
        //no_shadow
    }

#end

#macro YVector(xval,yval,Scale,Color)

    union{
        sphere{<xval,yval,FUNC(xval,yval)>, .02}
        cylinder{
            <xval,yval,FUNC(xval,yval)>,
            <xval,yval,FUNC(xval,yval)> + .8*Scale*<1,0,PARTIALX(xval,yval,0.0001)>,
            .01
        }
        cone{
            <xval,yval,FUNC(xval,yval)> + .8*Scale*<1,0,PARTIALX(xval,yval,0.0001)>, .03
            <xval,yval,FUNC(xval,yval)> + Scale*<1,0,PARTIALX(xval,yval,0.0001)>, 0
        }

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
