#!/bin/bash

# use like this:  mkmovie(ini_file_name, povray_file_name)
function mkmovie {
    # Run povray
    # This will create about 8x10^6 png files *_ddd.png
    povray $1.ini $2.pov
    # create an avi file from them
    mencoder "mf://$2*.png" -mf fps=24 -ovc lavc -lavcopTs vcodec=mpeg4:vbitrate=10125000 -o $2.avi
    # Cleanup
    rm $2*.png
}

#mkmovie curve trajectory
mkmovie curve embedding
mkmovie curve embedded_motion
