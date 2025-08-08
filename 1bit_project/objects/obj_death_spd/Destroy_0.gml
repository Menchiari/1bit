/// @description PUT CHANGES HERE
if activate==true
{
	event_inherited();
	global.player_spd = ds_list_find_value(global.lvl_spd, spd_lvl + spd_lvl_gain);
	global.xp -= xp_cost;
	if instance_exists(obj_global) {obj_global.global_xp=global.xp;}
	scr_savegame();
}
else
{
	var pile = instance_nearest(x,y,obj_death_pile);
	//if instance_exists(pile) instance_destroy(pile);
}