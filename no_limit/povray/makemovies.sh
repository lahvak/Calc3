#!/bin/sh

# Run povray for flyaround
# This created 8x10^6 png files flyaround_ddd.png
povray movie_hires.ini flyaround.pov
# create an avi file from them
mencoder "mf://flyaround*.png" -mf fps=24 -ovc lavc -lavcopTs vcodec=mpeg4:vbitrate=10125000 -o flyaround.avi
# Cleanup
rm flyaround*.png

# Run povray for topview
# This created 4x10^6 png files topview_ddd.png
povray movie_short_hires.ini topview.pov
# create an avi file from them
mencoder "mf://topview*.png" -mf fps=24 -ovc lavc -lavcopTs vcodec=mpeg4:vbitrate=10125000 -o topview.avi
# Cleanup
rm topview*.png

# Run povray for progress
# This created 4x10^6 png files progress_ddd.png
povray movie_short_hires.ini progress.pov
# create an avi file from them
mencoder "mf://progress*.png" -mf fps=24 -ovc lavc -lavcopTs vcodec=mpeg4:vbitrate=10125000 -o progress.avi
# Cleanup
rm progress*.png

# Run povray for progress_second
# This created 4x10^6 png files progress_second_ddd.png
povray movie_short_hires.ini progress_second.pov
# create an avi file from them
mencoder "mf://progress_second*.png" -mf fps=24 -ovc lavc -lavcopTs vcodec=mpeg4:vbitrate=10125000 -o progress_second.avi
# Cleanup
rm progress_second*.png

