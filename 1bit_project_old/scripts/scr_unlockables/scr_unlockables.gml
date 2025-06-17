// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_unlockables(unlock){
	if unlock==global.weapons[22] {global.unlock_wpn_sword=true;}
	if unlock==global.weapons[32] {global.unlock_wpn_stick=true;}
	if unlock==global.weapons[44] {global.unlock_wpn_katana=true;}
	if unlock==global.weapons[47] {global.unlock_wpn_katana_extreme=true;}
	
	if unlock==global.armors[22] {global.unlock_arm_metal=true;}
	if unlock==global.helms[21] {global.unlock_hlm_roman=true;}
}