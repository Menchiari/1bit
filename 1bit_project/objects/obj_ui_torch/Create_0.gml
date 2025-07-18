active=1;
radius=16;

active_range=20;
reactive_range=60;

xoff=sprite_get_xoffset(sprite_index);
yoff=sprite_get_yoffset(sprite_index);

xoriginal=x;
yoriginal=y;

if collision_point(x,y,obj_neutral_death,true,true) {instance_destroy();}