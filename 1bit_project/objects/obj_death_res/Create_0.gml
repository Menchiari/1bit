/// @description obj_death_res create
// Inherit the parent event
event_inherited();

// Ensure level lists exist
if (!ds_exists(global.lvl_res, ds_type_list) || !ds_exists(global.lvl_xp, ds_type_list)) {
    csv_level_import("CSV 1Bit Elements - Level Chart.csv");
}

main_color=c_red;
equip_helm(global.helms[23]);//great helm

res_lvl =		get_lvl(global.lvl_res, global.player_res);
res_lvl_gain =	get_lvl_gain(global.lvl_res, global.player_res);
xp_cost =		get_xp_cost(res_lvl,res_lvl_gain);

// Clamp index before reading value
var _n   = ds_list_size(global.lvl_res);
var _idx = clamp(res_lvl + res_lvl_gain, 0, _n - 1);
res_target_value = ds_list_find_value(global.lvl_res, _idx);


if res_lvl_gain == 0
{speech_text="I have nothing \nto offer.."; activate=false; instance_destroy();}
else
{speech_text="kill me to\nresist pain ";}

var pile = instance_nearest(x,y,obj_death_pile);
var pile_frame = res_lvl_gain;

if instance_exists(pile)
{
	if pile_frame >= pile.image_number
	{pile_frame = 20;}
	pile.type = 2;
	pile.image_index = pile_frame;
	pile.level = res_lvl+res_lvl_gain;
	if res_lvl_gain==0
	{
		pile.level=res_lvl;
		pile._xp_color=c_red;
	}
}