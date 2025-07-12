/// @description
//todo make a boss object instead
if !instance_exists(obj_enemy)
{	
	instance_create(obj_death);
}
alarm[0]=game_get_speed(gamespeed_fps)*3