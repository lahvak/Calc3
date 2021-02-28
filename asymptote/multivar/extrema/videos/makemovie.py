from moviepy.editor import *

prefix = "anim3"

contours = (VideoFileClip(prefix + "_contours.avi")
            .set_position(("left", "top"))
            .resize((800, 800))
            )
plot = (VideoFileClip(prefix + "_plot.avi")
        .set_position(("left", "bottom"))
        .resize((800, 800))
        )
surface = (VideoFileClip(prefix + "_surface.avi")
           .set_position(("right", "center"))
           .resize((1600, 1600))
           )


comp = CompositeVideoClip([contours, plot, surface], size=(2400, 1600))

comp.write_videofile(prefix + ".mp4")
