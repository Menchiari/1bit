/// @description
//todo make a boss object instead
if !instance_exists(obj_enemy_guardian)
{	
	room_goto(rm_faces_boss_death);
}
alarm[0]=game_get_speed(gamespeed_fps)*3