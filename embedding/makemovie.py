from moviepy.editor import *

#title = (ImageClip("TeX/static_dark_frames_000.png")
#                 .set_duration(4)
#                 .fadeout(1))


trajectory_movie = VideoFileClip("povray/trajectory.avi")
#circle_movie = VideoFileClip("povray/circle.avi")
#coaster_movie = VideoFileClip("povray/coaster.avi")

trajectory_length = trajectory_movie.duration

insert_1 = (ImageClip("TeX/insert_trajectory_1.png", transparent=True)
                .set_duration(trajectory_length/3)
                .set_position((0.15,0.15), relative=True)
                .crossfadein(.5)
                .crossfadeout(.5))
insert_2 = (ImageClip("TeX/insert_trajectory_2.png", transparent=True)
                .set_duration(trajectory_length/3)
                .set_start(trajectory_length/3)
                .set_position((0.15,0.15), relative=True)
                .crossfadein(.5)
                .crossfadeout(.5))
insert_3 = (ImageClip("TeX/insert_trajectory_3.png", transparent=True)
                .set_duration(trajectory_length/3)
                .set_start(2*trajectory_length/3)
                .set_position((0.15,0.15), relative=True)
                .crossfadein(.5)
                .crossfadeout(.5))

trajectory_comp = CompositeVideoClip([trajectory_movie, insert_1, insert_2, insert_3])

#comp = concatenate([title]+frame+[curve_movie]+circle+[circle_movie]+coaster+[coaster_comp])

trajectory_comp.write_videofile("trajectory.mp4")
