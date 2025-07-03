/// @description
if instance_exists(obj_hero)
{
	var xspawn=984;
	var yspawn=1570;
	show_debug_message("ending player spawn")
	obj_hero.x=xspawn;
	obj_hero.y=yspawn;
	obj_hero.dest_x=xspawn;
	obj_hero.dest_y=yspawn;
	obj_hero.state=states.sit;
	obj_hero.speed=0;
}