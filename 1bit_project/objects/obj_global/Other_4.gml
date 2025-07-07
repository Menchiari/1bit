//surface_resize(application_surface,room_width,room_height);
surface_resize(application_surface,global.res_x,global.res_y);

if room==rm_boat
|| room==rm_setup
{instance_create_depth(x,y,-y,obj_fx_fadein_fast);}

else
{instance_create_depth(x,y,-y,obj_fx_fadein);}

init_pathfinding_grid();