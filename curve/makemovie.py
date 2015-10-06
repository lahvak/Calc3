from moviepy.editor import *

title = (ImageClip("TeX/static_dark_frames_000.png")
                 .set_duration(4)
                 .fadeout(1))

frame = [ImageClip("TeX/static_frames_{:03d}.png".format(i)).set_duration(4) for i in range(6)]
circle = [ImageClip("TeX/static_frames_{:03d}.png".format(i)).set_duration(4) for i in [6,7,8]]
coaster = [ImageClip("TeX/static_frames_{:03d}.png".format(i)).set_duration(4) for i in [9,10,11]]
frame[0] = frame[0].fadein(1)
frame[-1] = frame[-1].fadeout(1)
circle[0] = circle[0].fadein(1)
circle[-1] = circle[-1].fadeout(1)
coaster[0] = coaster[0].fadein(1)
coaster[-1] = coaster[-1].fadeout(1)

curve_movie = VideoFileClip("povray/curve.avi")
circle_movie = VideoFileClip("povray/circle.avi")
coaster_movie = VideoFileClip("povray/coaster.avi")

w,h = movie_size = coaster_movie.size

small_coaster = (VideoFileClip("povray/circle.avi").
                 resize((w/3,h/3)).
                 margin(4,color=(100,100,100)).
                 margin(bottom=10,right=10,opacity=0).
                 set_pos(('right','bottom')))

coaster_comp = CompositeVideoClip([coaster_movie, small_coaster])

comp = concatenate([title]+frame+[curve_movie]+circle+[circle_movie]+coaster+[coaster_comp])

comp.write_videofile("tnb.mp4")
