/// @description
//todo make a boss object instead
if !instance_exists(obj_enemy_creator)
{	
	if once=true
	{
		once=false;
		alarm[1]=game_get_speed(gamespeed_fps)*6
		var _fader=instance_create(obj_fx_fadeout);
		_fader.fade_speed=.01;
	}
}
alarm[0]=game_get_speed(gamespeed_fps)*1