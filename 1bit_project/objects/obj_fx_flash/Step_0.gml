if instance_exists(obj_global)
{
	obj_global.g+=reduction_speed;
	if obj_global.g>default_gamma
	{
		obj_global.g=default_gamma;
	}
}
if instance_exists(obj_hero)
{
	sprite_index=spr_hero;
	flash_x=obj_hero.x;
	flash_y=obj_hero.y;
	flash_dir=obj_hero.dir;
	flash_index=obj_hero.image_index;
}