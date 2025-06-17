draw_self();
if footprint_opacity>footprint_min {footprint_opacity-=footprint_fade/room_speed;}
if footprint_opacity<0 {instance_destroy();}

footprint_duration-=1;
if footprint_duration<=0 {instance_destroy();}