global_settings {
   assumed_gamma 1
}

#declare CamLoc = < 12, 8, 10>;

camera {
   location CamLoc
   look_at < 0, 0, 0> 
   angle 25
}

light_source {CamLoc color White*0.35 shadowless}
light_source {<-50, 150,-75> color White shadowless}

background {color White}
