//surface_resize(application_surface,room_width,room_height);
surface_resize(application_surface,global.res_x,global.res_y);

if room!=rm_boat
{instance_create_depth(x,y,-y,obj_fx_fadein);}

if room==rm_boat {instance_create_depth(x,y,-y,obj_fx_fadein_fast);}