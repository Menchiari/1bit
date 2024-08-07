// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_restart(){
	if instance_exists(obj_hero) {instance_destroy(obj_hero);}
	//global.player_hp=global.player_hp_max;
	room_goto(rm_menu_character);
}