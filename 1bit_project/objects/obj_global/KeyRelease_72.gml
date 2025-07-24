/// @description ADD HEALTH
if instance_exists(obj_hero)
{
	with obj_hero
	{
		if keyboard_check(vk_control) {hp_max*=2;}
		hp=hp_max;
	}
}