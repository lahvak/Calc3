global_settings {
   assumed_gamma 1
}

camera {
   location CamLoc
   right 1.7777777*x
   up y
   look_at < 0, 0, 0> 
   angle 21 
}

light_source {CamLoc color White*0.35 shadowless}
light_source {<-50, 150,-75> color White shadowless}

background {color White}
