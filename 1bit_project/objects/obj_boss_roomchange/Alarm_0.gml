/// @description
//todo make a boss object instead
if !instance_exists(obj_enemy_guardian)
{	
	if once=true
	{
		once=false;
		alarm[1]=game_get_speed(gamespeed_fps)*3
		instance_create(obj_fx_fadeout);
	}
}
alarm[0]=game_get_speed(gamespeed_fps)*1