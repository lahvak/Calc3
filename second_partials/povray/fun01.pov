// POV-Ray 3.6 / 3.7 Scene File "fun01.pov"
// author: Friedrich A. Lohmueller
// date: May 2005/Aug-2009 /Feb-2011
// email: Friedrich.Lohmueller_at_t-online.de
// http:// www.friedrich.lohmueller.de/
//------------------------------------------------------------------------
// Choose image_size by               Wählen Sie die Bildgröße, indem
// adding to the commandline:         sie in der Kommandozeile einfügen:
//
//                      +h700 +w700 
//
//------------------------------------------------------------------------
#version 3.6; // 3.7;
global_settings{assumed_gamma 1.0} 
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
//------------------------------------------------------------------------
#declare Camera_0 = camera { perspective
                             location  < 0.00, 0.00,-40.0>
                             look_at   < 0.00, 0.00, 0.00>
                             angle 15.7
                             right     x*image_width/image_height
                           }
camera{Camera_0}

//------------------------------------------------------------------------
// sun -------------------------------------------------------------------
light_source{<1000,1000,-2500> color White}
// sky -------------------------------------------------------------------
sky_sphere{ pigment{ gradient <0,1,0>
                     color_map{ [0   color rgb<1,1,1>         ]//White
                                [0.4 color rgb<0.14,0.14,0.56>]//~Navy
                                [0.6 color rgb<0.14,0.14,0.56>]//~Navy
                                [1.0 color rgb<1,1,1>         ]//White
                              }
                     scale 2 }
           } // end of sky_sphere
//------------------------------------------------------------------------



// ground -----------------------------------------------------------------
//---------------------------------<<< settings of squared plane dimensions
#declare RasterScale = 1;
#declare RasterHalfLine  = 0.01;
#declare RasterHalfLineY = 0.01;
//-------------------------------------------------------------------------
#macro Raster(RScale, HLine)
       pigment{ gradient x scale RScale
                color_map{[0.000   color rgbt<1,1,1,0>*0.8]
                          [0+HLine color rgbt<1,1,1,0>*0.8]
                          [0+HLine color rgbt<1,1,1,1>]
                          [1-HLine color rgbt<1,1,1,1>]
                          [1-HLine color rgbt<1,1,1,0>*0.8]
                          [1.000   color rgbt<1,1,1,0>*0.8]} }
       finish { ambient 0.15 diffuse 0.85}
 #end// of Raster(RScale, HLine)-macro
//-------------------------------------------------------------------------


plane { <0,1,0>, 0    // plane with layered textures
        texture { pigment{color White*1.1
                  filter .5}
                  finish {ambient 0.45 diffuse 0.85}}
        texture { Raster(RasterScale,RasterHalfLine ) rotate<0,0,0> }
        texture { Raster(RasterScale,RasterHalfLineY) rotate<0,90,0>}
        rotate<-90,0,0>
      }
