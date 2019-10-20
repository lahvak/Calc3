#!/bin/sh

# Run povray for curve
# This created 8x10^6 png files curve_ddd.png
povray curve.ini curve.pov
# create an avi file from them
mencoder "mf://curve*.png" -mf fps=24 -ovc lavc -lavcopTs vcodec=mpeg4:vbitrate=10125000 -o curve.avi
# Cleanup
rm curve*.png

# Run povray for circle
# This created 4x10^6 png files circle_ddd.png
povray curve.ini circle.pov
# create an avi file from them
mencoder "mf://circle*.png" -mf fps=24 -ovc lavc -lavcopTs vcodec=mpeg4:vbitrate=10125000 -o circle.avi
# Cleanup
rm circle*.png

# Run povray for coaster
# This created 4x10^6 png files coaster_ddd.png
povray curve.ini coaster.pov
# create an avi file from them
mencoder "mf://coaster*.png" -mf fps=24 -ovc lavc -lavcopTs vcodec=mpeg4:vbitrate=10125000 -o coaster.avi
# Cleanup
rm coaster*.png
