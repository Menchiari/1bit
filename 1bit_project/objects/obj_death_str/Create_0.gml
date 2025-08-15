/// @description COSTUME DESIGN
// Inherit the parent event
event_inherited();

// Ensure level lists exist
if (!ds_exists(global.lvl_str, ds_type_list) || !ds_exists(global.lvl_xp, ds_type_list)) {
    csv_level_import("CSV 1Bit Elements - Level Chart.csv");
}

main_color=c_red;
equip_helm(global.helms[22]);//viking helm

str_lvl =		get_lvl(global.lvl_str, global.player_str);
str_lvl_gain =	get_lvl_gain(global.lvl_str, global.player_str);
xp_cost =		get_xp_cost(str_lvl,str_lvl_gain);

// Clamp index before reading value
var _n   = ds_list_size(global.lvl_str);
var _idx = clamp(str_lvl + str_lvl_gain, 0, _n - 1);
str_target_value = ds_list_find_value(global.lvl_str, _idx);


if str_lvl_gain == 0
{speech_text="I have nothing \nto offer.."; activate=false; instance_destroy();}
else
{speech_text="execute me to\nget stronger";}

var pile = instance_nearest(x,y,obj_death_pile);
var pile_frame = str_lvl_gain;

if instance_exists(pile)
{
	if pile_frame >= pile.image_number
	{pile_frame = 20;}
	pile.type = 1;
	pile.image_index = pile_frame;
	pile.level = str_lvl+str_lvl_gain;
	if str_lvl_gain==0
	{
		pile.level=str_lvl;
		pile._xp_color=c_red;
	}
}