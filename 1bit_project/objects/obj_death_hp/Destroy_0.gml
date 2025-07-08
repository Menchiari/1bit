/// @description PUT CHANGES HERE
// Inherit the parent event
if activate==true
{
	event_inherited();
	global.player_hp_max = ds_list_find_value(global.lvl_hp, hp_lvl + hp_lvl_gain);
	global.xp -= xp_cost;
	if instance_exists(obj_global) {obj_global.global_xp=global.xp;}
	scr_savegame();
}