if instance_exists(obj_camera)
{
	if point_distance(x,y,obj_camera.x,obj_camera.y)<(global.res_y+sprite_height)
	{
		draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,rotation,color,alpha);
	}
}