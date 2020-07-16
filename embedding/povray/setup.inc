global_settings {
   assumed_gamma 1
}

#declare CamLoc = < 24, 18, -36>;

camera {
   location CamLoc
   look_at < -2, 0, -2> 
   angle 15
}

light_source {CamLoc color White*0.35 shadowless}
light_source {<-50, 150,-75> color White shadowless}

background {color White}
