/// @description obj_death_spd step
// Inherit the parent event
event_inherited();

// Ensure level lists exist
if (!ds_exists(global.lvl_spd, ds_type_list) || !ds_exists(global.lvl_xp, ds_type_list)) {
    csv_level_import("CSV 1Bit Elements - Level Chart.csv");
}

main_color=c_red;
equip_helm(global.helms[01]);//stray hat

spd_lvl =		get_lvl(global.lvl_spd, global.player_spd);
spd_lvl_gain =	get_lvl_gain(global.lvl_spd, global.player_spd);
xp_cost =		get_xp_cost(spd_lvl,spd_lvl_gain);

// Clamp index before reading value
var _n   = ds_list_size(global.lvl_spd);
var _idx = clamp(spd_lvl + spd_lvl_gain, 0, _n - 1);
spd_target_value = ds_list_find_value(global.lvl_spd, _idx);


if spd_lvl_gain == 0
{speech_text="I have nothing \nto offer.."; activate=false; instance_destroy();}
else
{speech_text="slaughter me \nto be faster";}

var pile = instance_nearest(x,y,obj_death_pile);
var pile_frame = spd_lvl_gain;

if instance_exists(pile)
{
	if pile_frame >= pile.image_number
	{pile_frame = 20;}
	pile.type = 3;
	pile.image_index = pile_frame;
	pile.level = spd_lvl+spd_lvl_gain;
	if spd_lvl_gain==0
	{
		pile.level=spd_lvl;
		pile._xp_color=c_red;
	}
}