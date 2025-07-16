/// @description

// Inherit the parent event
event_inherited();

character_head=character_head_var//spr_head_infected;
name=name_var;
equip_weapon(global.weapons[weapon_var]);
equip_armor(global.armors[armor_var]);
equip_helm(global.helms[helm_var]);
drop_rate=drop_rate_var;
//main stats
hp_max=hp_var;
hp=hp_max;
str=str_var;
res=res_var;
//AI
if override_ai==true
{
	ai_state=custom_ai;
	ai_state_original=ai_state;
	faction=factions.ally;
}
state=starting_state_var;
dir=dir_var;
sit_idle_a=sit_idle_a_var;
sit_idle_b=sit_idle_b_var;

skin_color=color_var;
speech_color=speech_color_var;