/// @description PUT CHANGES HERE
if activate==true
{
	event_inherited();
	global.player_str = ds_list_find_value(global.lvl_str, str_lvl + str_lvl_gain);
	global.xp -= xp_cost;
}