#!/bin/sh

# Run povray for collision
# This created 8x10^6 png files curve_ddd.png
povray lines.ini collision.pov
# create an avi file from them
mencoder "mf://collision*.png" -mf fps=24 -ovc lavc -lavcopTs vcodec=mpeg4:vbitrate=10125000 -o collision.avi
# Cleanup
rm collision*.png

# Run povray for post collision
# This created 8x10^6 png files curve_ddd.png
povray lines2.ini collision.pov
# create an avi file from them
mencoder "mf://collision*.png" -mf fps=24 -ovc lavc -lavcopTs vcodec=mpeg4:vbitrate=10125000 -o collision2.avi
# Save the actual collision frame
mv `ls collision*.png | head -1` bam.png
# Cleanup
rm collision*.png

# Run povray for noncollision
# This created 8x10^6 png files curve_ddd.png
povray lines3.ini noncollision.pov
# create an avi file from them
mencoder "mf://noncollision*.png" -mf fps=24 -ovc lavc -lavcopTs vcodec=mpeg4:vbitrate=10125000 -o noncollision.avi
# Cleanup
rm noncollision*.png

