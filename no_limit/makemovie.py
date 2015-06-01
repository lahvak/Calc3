from moviepy.editor import *

title = (ImageClip("TeX/static_dark_frames_000.png")
                 .set_duration(3)
                 .fadeout(1))
intro1 = (ImageClip("TeX/static_frames_000.png")
                 .set_duration(3)
                 .fadein(1))
intro2 = (ImageClip("TeX/static_frames_001.png")
                 .set_duration(3)
                 .fadeout(1))

density = [ImageClip("TeX/static_frames_{:03d}.png".format(i)).set_duration(5) for i in [2,3,4]]
contours = ImageClip("TeX/static_frames_005.png").set_duration(8).fadeout(1)
limits = [ImageClip("TeX/static_frames_{:03d}.png".format(i)).set_duration(5) for i in [6,7,8,9,10,11]]
ending = [ImageClip("TeX/static_frames_{:03d}.png".format(i)).set_duration(5) for i in [12,13,14]]
density[0] = density[0].fadein(1)
limits[0] = limits[0].fadein(1)
limits[-1] = limits[-1].fadeout(1)
ending[2] = ending[2].fadeout(1)

flyintro = (ImageClip("TeX/static_dark_frames_001.png")
                 .set_duration(2)
                 .fadein(1)
                 .fadeout(1))
flyaround = VideoFileClip("povray/flyaround.avi")
totop = VideoFileClip("povray/topview.avi")
twodcont = VideoFileClip("TeX/anim_curves.avi")
aftertwodcont = (ImageClip("TeX/after_anim_curves_000.png")
                 .set_duration(3)
                 .fadeout(1))
threedcont1 = VideoFileClip("povray/progress.avi")
threedcont2 = VideoFileClip("povray/progress_second.avi")

comp = concatenate([title,intro1,intro2]+density+[contours,flyintro,flyaround,totop]+limits+[twodcont,aftertwodcont,threedcont1,threedcont2]+ending)

comp.write_videofile("all.mp4")
