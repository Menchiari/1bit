shake = 1;
max_shake = 5;
show_debug_message("Screenshake created at x:"+string(x)+", y:"+string(y));

if instance_exists(obj_camera)
{
	view_x=obj_camera.x;
	view_y=obj_camera.y;
}