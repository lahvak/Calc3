#!/bin/sh

# Run povray for flyaround
# This created 8x10^6 png files flyaround_ddd.png
#povray movie_hires.ini flyaround.pov
# create an avi file from them
mencoder "mf://progressY*.png" -mf fps=24 -ovc lavc -lavcopTs vcodec=mpeg4:vbitrate=10125000 -o progressY.avi
# Cleanup
#rm flyaround*.png

