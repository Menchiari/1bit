/// @description COSTUME DESIGN
// Inherit the parent event
event_inherited();

main_color=c_red;
equip_helm(global.helms[26]);//red crown



hp_lvl =		get_lvl(global.lvl_hp, global.player_hp_max);
hp_lvl_gain =	get_lvl_gain(global.lvl_hp, global.player_hp_max);
xp_cost =		get_xp_cost(hp_lvl,hp_lvl_gain);

if hp_lvl_gain = 0
{speech_text="I have nothing \nto offer.."; activate=false; instance_destroy();}
else
{speech_text="drain my life\nto gain health";}

var pile = instance_nearest(x,y,obj_death_pile);

var pile_frame = hp_lvl_gain;

if pile_frame >= pile.image_number
{pile_frame = 20;}
pile.type = 0;
pile.image_index = pile_frame;