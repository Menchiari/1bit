/// @description PUT CHANGES HERE
if activate==true
{
	event_inherited();
	global.player_spd = ds_list_find_value(global.lvl_spd, spd_lvl + spd_lvl_gain);
	global.xp -= xp_cost;
}