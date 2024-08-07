// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_init_hero(){
faction=factions.ally;
name="hero"

sprite_skin=global.player_skin;
character_head=global.player_head;
control=global.player_control;
equip_weapon(global.player_weapon);
equip_armor(global.player_armor);
equip_helm(global.player_helm);
hp_max=global.player_hp_max;
hp=global.player_hp_max;
res=global.player_res;
str=global.player_str;
spd=global.player_spd;

invincibility_timer=global.player_invincibility_timer;

scr_balancing();
}