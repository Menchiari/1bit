/// @description COSTUME DESIGN
// Inherit the parent event
event_inherited();

main_color=c_red;
equip_helm(global.helms[01]);//stray hat




spd_lvl =		get_lvl(global.lvl_spd, global.player_spd);
spd_lvl_gain =	get_lvl_gain(global.lvl_spd, global.player_spd);
xp_cost =		get_xp_cost(spd_lvl,spd_lvl_gain);

if spd_lvl_gain = 0
{speech_text="I have nothing \nto offer.."; activate=false; instance_destroy();}
else
{speech_text="slaughter me \nto be faster";}


var pile = instance_nearest(x,y,obj_death_pile);

var pile_frame = spd_lvl_gain;

if pile_frame >= pile.image_number
{pile_frame = 20;}
pile.type = 3;
pile.image_index = pile_frame;