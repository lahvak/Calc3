from moviepy.editor import *

title = (ImageClip("TeX/static_dark_frames_000.png")
                 .set_duration(3)
                 .fadeout(1))

pre_collision = [ImageClip("TeX/static_frames_{:03d}.png".format(i)).set_duration(5) for i in range(2)]
post_collision = [ImageClip("TeX/static_frames_{:03d}.png".format(i)).set_duration(5) for i in range(2,13)]
post_noncollision = [ImageClip("TeX/static_frames_{:03d}.png".format(i)).set_duration(4) for i in range(13,28)]
pre_collision[0] = pre_collision[0].fadein(1)
pre_collision[-1] = pre_collision[-1].crossfadeout(1)
post_collision[0] = post_collision[0].crossfadein(1)
post_collision[-1] = post_collision[-1].crossfadeout(1)
post_noncollision[0] = post_noncollision[0].crossfadein(1)
post_noncollision[-1] = post_noncollision[-1].fadeout(1)
bam = ImageClip("povray/bam.png").set_duration(4)

pre_collision_movie = VideoFileClip("povray/collision.avi").crossfadein(1)
post_collision_movie = VideoFileClip("povray/collision2.avi").crossfadeout(1)
noncollision_movie = VideoFileClip("povray/noncollision.avi").crossfadein(1).crossfadeout(1)

w,h = movie_size = pre_collision_movie.size

collision_insert = (ImageClip("TeX/insert_collision.png", transparent=True)
                       .set_duration(3.8)
                       .set_position((0.15,0.15), relative=True)
                       .crossfadein(.2)
                       .crossfadeout(.2))

bam_comp = CompositeVideoClip([bam, collision_insert])

comp = concatenate([title]+pre_collision+[pre_collision_movie, bam_comp, post_collision_movie]+post_collision+[noncollision_movie]+post_noncollision)

comp.write_videofile("intersecting_lines.mp4")
