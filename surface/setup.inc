global_settings {
   assumed_gamma 1
}

#declare CamLoc = < 6, 4, 4>;

camera {
   location CamLoc
   look_at < 0, 0, 0> 
   angle 35
}

light_source {CamLoc color White*0.35 shadowless}
light_source {<-50, 150,-75> color White shadowless}

background {color White}
