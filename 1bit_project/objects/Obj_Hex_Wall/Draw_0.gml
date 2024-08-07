if instance_exists(obj_camera)
{
	if point_distance(x,y,obj_camera.x,obj_camera.y)<(global.res_y+sprite_height)
	{
		draw_set_color(HexColor);
		draw_set_alpha(.75);
		draw_self();
		draw_set_color(image_blend);
		draw_set_alpha(image_alpha);
	}
}