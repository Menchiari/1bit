/// @description
if instance_exists(obj_hero)
&& instance_exists(obj_camera)
{
	audio_listener_position(obj_hero.x,obj_hero.y,0);
	audio_listener_orientation(0, 0, -1, 0, 1, 0); // forward facing into screen
}
else
{
	var cam = view_camera[0];
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);

	audio_listener_position(cam_x, cam_y, 0);
}