///@description reduce gamma
sprite_index=sprite;
if instance_exists(obj_global) && fadeout==true
{
	obj_global.g+=reduction_speed;
	if obj_global.g>default_gamma
	{
		obj_global.g=default_gamma;
	}
}
dead_mannequin=instance_nearest(x,y,obj_dead);
if instance_exists(dead_mannequin)
{
	x=dead_mannequin.x;
	y=dead_mannequin.y;
	image_index=dead_mannequin.image_index;
	dir=dead_mannequin.dir;
	size=dead_mannequin.size;
}