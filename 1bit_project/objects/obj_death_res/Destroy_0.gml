/// @description PUT CHANGES HERE
if activate==true
{
	event_inherited();
	global.player_res = ds_list_find_value(global.lvl_res, res_lvl + res_lvl_gain);
	global.xp -= xp_cost;
	if instance_exists(obj_global) {obj_global.global_xp=global.xp;}
}