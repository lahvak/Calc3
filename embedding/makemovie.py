import os
from moviepy.editor import *

title = (ImageClip("TeX/static_dark_frames_000.png")
                 .set_duration(4)
                 .fadeout(1))

intro = [ImageClip("TeX/" + fname).set_duration(8)
         for fname in sorted(os.listdir("TeX"))
         if fname.startswith("intro") and fname.endswith(".png")]
intro[0] = intro[0].fadein(1)
intro[-1] = intro[-1].fadeout(1)

embedding = [ImageClip("TeX/" + fname).set_duration(8)
         for fname in sorted(os.listdir("TeX"))
         if fname.startswith("embedding") and fname.endswith(".png")]
embedding[0] = embedding[0].fadein(1)
embedding[-1] = embedding[-1].fadeout(1)

motion = [ImageClip("TeX/" + fname).set_duration(8)
         for fname in sorted(os.listdir("TeX"))
         if fname.startswith("motion") and fname.endswith(".png")]
motion[0] = motion[0].fadein(1)
motion[-1] = motion[-1].fadeout(1)

trajectory_movie = VideoFileClip("povray/trajectory.avi")
embedding_movie = VideoFileClip("povray/embedding.avi")
motion_movie = VideoFileClip("povray/embedded_motion.avi")

trajectory_length = trajectory_movie.duration
embedding_length = embedding_movie.duration
motion_length = motion_movie.duration

trajectory_insert_1 = (ImageClip("TeX/insert_trajectory_1.png", transparent=True)
                       .set_duration(trajectory_length/3)
                       .set_position((0.15,0.15), relative=True)
                       .crossfadein(.5)
                       .crossfadeout(.5))
trajectory_insert_2 = (ImageClip("TeX/insert_trajectory_2.png", transparent=True)
                       .set_duration(trajectory_length/3)
                       .set_start(trajectory_length/3)
                       .set_position((0.15,0.15), relative=True)
                       .crossfadein(.5)
                       .crossfadeout(.5))
trajectory_insert_3 = (ImageClip("TeX/insert_trajectory_3.png", transparent=True)
                       .set_duration(trajectory_length/3)
                       .set_start(2*trajectory_length/3)
                       .set_position((0.15,0.15), relative=True)
                       .crossfadein(.5)
                       .crossfadeout(.5))

trajectory_comp = CompositeVideoClip([trajectory_movie, trajectory_insert_1,
                                      trajectory_insert_2, trajectory_insert_3])

embedding_insert_1 = (ImageClip("TeX/insert_embedding_1.png", transparent=True)
                       .set_duration(embedding_length/6)
                       .set_position((0.15,0.15), relative=True)
                       .crossfadeout(.5))
embedding_insert_2 = (ImageClip("TeX/insert_embedding_2.png", transparent=True)
                       .set_duration(2*embedding_length/3)
                       .set_start(embedding_length/6)
                       .set_position((0.15,0.15), relative=True)
                       .crossfadein(.5)
                       .crossfadeout(.5))
embedding_insert_3 = (ImageClip("TeX/insert_embedding_3.png", transparent=True)
                       .set_duration(embedding_length/6)
                       .set_start(5*embedding_length/6)
                       .set_position((0.15,0.15), relative=True)
                       .crossfadein(.5))

embedding_comp = (CompositeVideoClip([embedding_movie, embedding_insert_1,
                                      embedding_insert_2, embedding_insert_3])
                  )

embedding_first = embedding_comp.to_ImageClip(duration=3)
embedding_last = embedding_comp.to_ImageClip(t=embedding_length-.1, duration=3)

comp = concatenate([title] + intro +
                   [trajectory_comp] + embedding +
                   [embedding_first, embedding_comp, embedding_last] +
                   motion + [motion_movie])

comp.write_videofile("embedding.mp4")
