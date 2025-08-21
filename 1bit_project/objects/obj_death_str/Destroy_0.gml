/// @description obj_death_str destroy
if activate==true
{
	event_inherited();
	global.player_str = str_target_value//ds_list_find_value(global.lvl_str, str_lvl + str_lvl_gain);
	global.xp -= xp_cost;
	if instance_exists(obj_global) {obj_global.global_xp=global.xp;}
	scr_savegame();
}
else
{
	var pile = instance_nearest(x,y,obj_death_pile);
	//if instance_exists(pile) instance_destroy(pile);
}