if collision_point(x,y,obj_trigger_deathfall,true,true) {instance_destroy();}
else {instance_create_depth(x,y,-y,obj_fx_splash);}