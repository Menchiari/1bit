draw_self();
if footprint_opacity>footprint_min {footprint_opacity-=footprint_fade/game_get_speed(gamespeed_fps);}
if footprint_opacity<0 {instance_destroy();}

footprint_duration-=1;
if footprint_duration<=0 {instance_destroy();}