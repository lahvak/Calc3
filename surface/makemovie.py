from moviepy.editor import *

intro = (TextClip("Traces of a surface", color='white', bg_color='black',
                 fontsize=32,font="LucidaCasual", size=(400,400))
                 .set_position(('center','center'))
                 .set_duration(3)
                 .fadeout(1))
xdesc = (TextClip("Parallel to the\nyz-plane",color='white',bg_color='black',
                  fontsize=24,font="LucidaCasual", size=(400,400))
                  .set_position(('center','center'))
                  .set_duration(3)
                  .fadein(1)
                  .fadeout(1))
ydesc = (TextClip("Parallel to the\nxz-plane",color='white',bg_color='black',
                  fontsize=24,font="LucidaCasual", size=(400,400))
                  .set_position(('center','center'))
                  .set_duration(3)
                  .fadein(1)
                  .fadeout(1))
zdesc = (TextClip("Parallel to the\nxy-plane",color='white',bg_color='black',
                  fontsize=24,font="LucidaCasual", size=(400,400))
                  .set_position(('center','center'))
                  .set_duration(3)
                  .fadein(1)
                  .fadeout(1))
yzdesc = (TextClip("Plane y = kz",color='white',bg_color='black',
                  fontsize=24,font="LucidaCasual", size=(400,400))
                  .set_position(('center','center'))
                  .set_duration(3)
                  .fadein(1)
                  .fadeout(1))
xcuts = VideoFileClip("xcuts.avi")
ycuts = VideoFileClip("ycuts.avi")
zcuts = VideoFileClip("zcuts.avi")
yzcuts = VideoFileClip("yzcuts.avi")

comp = concatenate([intro, ydesc, ycuts, zdesc, zcuts, xdesc, xcuts, yzdesc, yzcuts, yzcuts])

comp.write_videofile("all.mp4")
