/// @description teleport hero
if instance_exists(obj_hero)
{
	obj_hero.x=x;obj_hero.y=y;
	if instance_number(obj_hero)>1 {instance_destroy(obj_hero);}
	speed=0;
}