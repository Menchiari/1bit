/// @description COSTUME DESIGN
// Inherit the parent event
event_inherited();

main_color=c_red;
equip_helm(global.helms[23]);//great helm




res_lvl =		get_lvl(global.lvl_res, global.player_res);
res_lvl_gain =	get_lvl_gain(global.lvl_res, global.player_res);
xp_cost =		get_xp_cost(res_lvl,res_lvl_gain);


if res_lvl_gain = 0
{speech_text="I have nothing \nto offer.."; activate=false; instance_destroy();}
else
{speech_text="kill me to\nresist pain";}

var pile = instance_nearest(x,y,obj_death_pile);

var pile_frame = res_lvl_gain;

if pile_frame >= pile.image_number
{pile_frame = 20;}
pile.type = 2;
pile.image_index = pile_frame;