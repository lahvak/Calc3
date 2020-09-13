#declare sane_to_insane = transform {
    matrix <0, 0, -1,
    1, 0, 0,
    0, 1, 0,
    0, 0, 0>
}

#macro Line (R0, V, T, Thickness, Color, SSize, SColor)
    cylinder {
        R0, R0 + T*V, Thickness/2
        texture {pigment{color Color} finish {phong 0 specular 0 reflection {0}}} 
        no_shadow
        transform sane_to_insane
    }
    sphere {
        R0 + T*V, SSize/2
        texture {pigment{color SColor} finish {phong 0 specular 0 reflection {0}}} 
        no_shadow
        transform sane_to_insane
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

