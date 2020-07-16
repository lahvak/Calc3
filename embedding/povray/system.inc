#declare NLineStart = <-6,-4,-5.1>;
#declare NLineEnd = <-2,-4,-2>;
#declare NLineDir = NLineEnd - NLineStart;

#declare TgtCurve = spline {
    cubic_spline
    #declare Index = 0;
    #while(Index <= 79)
        #local T = -1 + Index*2/79;
        #local Adj = 3*T*T*T;
        T, <2*sin(Adj+0.5),pow(1-Adj,2)/3-2,2*cos(Adj)>

        #declare Index = Index + 1;
    #end
}

#macro SphereSrc(Color, Size, T)
    sphere {
        NLineStart + (T + 1)/2*NLineDir, Size
        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}}
        no_shadow
    }
#end

#macro SphereTgt(Color, Size, T)
    sphere {
        TgtCurve(T), Size
        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}}
        no_shadow
    }
#end

#macro Piece (T0, T1, Color, Thickness, Time)
    sphere_sweep {
        b_spline
        50,
        #local Len = (T1 - T0)/48;
        #local Index = 0;
        #while(Index <= 49)

            #local T = T0 + Index*Len;
            Time*TgtCurve(T) +
            (1 - Time)*(NLineStart + (T + 1)/2*NLineDir),
            Thickness

            #local Index = Index + 1;
        #end

        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
        no_shadow
    }
#end

#macro Curve(n, Color1, Color2, Thickness, Time)
    #local Len = 1/n;
    #for(i,0,n-1)
        Piece(-1 + 2*i*Len, -1 + (2*i + 1)*Len, Color1, Thickness, Time)
        Piece(-1 + (2*i + 1)*Len, -1 + 2*(i + 1)*Len, Color2,
            Thickness, Time)
    #end
#end

#macro Trajectory (Color, Thickness, Time)
    #local Nodes = 5 + ceil(50*(Time + 1));
    sphere_sweep {
        b_spline
        Nodes,
        #local Len = (Time + 1)/(Nodes - 2);
        #local Index = 0;
        #while(Index < Nodes)

            #local T = -1 + Index*Len;
            TgtCurve(T)
            Thickness

            #local Index = Index + 1;
        #end

        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
        no_shadow
    }
#end

// Axes:
//x is -z, y is x, and z is y

#macro Axes(x0, x1, y0, y1, z0, z1, Thickness, Texture)
    cylinder {<0,0,-x1>,<0,0,-x0>,Thickness texture{Texture}} //x-axis
    cylinder {<y0,0,0>,<y1,0,0>,Thickness texture{Texture}} //y-axis
    cylinder {<0,z0,0>,<0,z1,0>,Thickness texture{Texture}} //z-axis

    cone {<0,0,-x1>,3*Thickness <0,0,-x1-8*Thickness>,0 texture{Texture}}
    cone {<y1,0,0>,3*Thickness <y1+8*Thickness,0,0>,0 texture{Texture}}
    cone {<0,z1,0>,3*Thickness <0,z1+8*Thickness,0>,0 texture{Texture}}
#end


#macro NumberLine(n, Color1, Color2, V0, V1, Thickness)
    #local DV = (V1 - V0)/(2*n);

    #for (i,0,n-1)
        cylinder{V0 + 2*i*DV, V0 + (2*i + 1)*DV, Thickness texture{pigment{color Color1}}}
        cylinder{V0 + (2*i+1)*DV, V0 + 2*(i + 1)*DV, Thickness texture{pigment{color Color2}}}
    #end
#end
