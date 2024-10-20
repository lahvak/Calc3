global_settings {
   assumed_gamma 1
   max_trace_level 32
   adc_bailout 1/32
}

camera {
   location CamLoc
   sky <0,0,1>
   up <0,0,1>
   right <-1.33,0,0>
   look_at <0, 0, 0> 
   angle 21 
}

light_source {CamLoc color White*0.35 shadowless}
light_source {<50, -20, 150> color White shadowless}
light_source {<100, 40, 200> color <.8,.8,1> shadowless}

background {color White}
