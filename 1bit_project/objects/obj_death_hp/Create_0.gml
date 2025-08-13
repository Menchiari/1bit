/// @description COSTUME DESIGN
// Inherit the parent event
event_inherited();

// Ensure level lists exist
if (!ds_exists(global.lvl_hp, ds_type_list)) {
    csv_level_import("CSV 1Bit Elements - Level Chart.csv");
}


main_color=c_red;
equip_helm(global.helms[26]);//red crown



hp_lvl =		get_lvl(global.lvl_hp, global.player_hp_max);
hp_lvl_gain =	get_lvl_gain(global.lvl_hp, global.player_hp_max);
xp_cost =		get_xp_cost(hp_lvl,hp_lvl_gain);

// after you compute str_lvl, str_lvl_gain, xp_cost
hp_target_value = ds_list_find_value(global.lvl_hp, hp_lvl + hp_lvl_gain);
// (optional) cap for safety
if (hp_lvl + hp_lvl_gain >= ds_list_size(global.lvl_hp)) {
    hp_target_value = ds_list_find_value(global.lvl_hp, ds_list_size(global.lvl_hp) - 1);
}


if hp_lvl_gain == 0
{speech_text="I have nothing \nto offer.."; activate=false; instance_destroy();}
else
{speech_text="drain my life\nto gain health";}

var pile = instance_nearest(x,y,obj_death_pile);

var pile_frame = hp_lvl_gain;

if instance_exists(pile)
{
	if pile_frame >= pile.image_number
	{pile_frame = 20;}
	pile.type = 0;
	pile.image_index = pile_frame;
	pile.level = hp_lvl+hp_lvl_gain;
	if hp_lvl_gain==0
	{
		pile.level=hp_lvl;
		pile._xp_color=c_red;
	}
}