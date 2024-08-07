function scr_loadgame(){
ini_open("save.sav")
	global.room_list=ini_read_real("savegame"+string(global.slot),"roomlist",global.room_list);
	global.chosen_room=ini_read_real("savegame"+string(global.slot),"room",global.chosen_room);
	
	global.xp=ini_read_real("savegame"+string(global.slot),"xp",global.xp);
	global.player_lives=ini_read_real("savegame"+string(global.slot),"lives",global.player_lives);
	global.deathcount=ini_read_real("savegame"+string(global.slot),"deathcount",global.deathcount);
	
	var ds_unlock_wpn = ini_read_string("savegame"+string(global.slot),"unlock_wpn",global.unlock_wpn);
	var ds_unlock_arm = ini_read_string("savegame"+string(global.slot),"unlock_arm",global.unlock_arm);
	var ds_unlock_hlm = ini_read_string("savegame"+string(global.slot),"unlock_hlm",global.unlock_hlm);
	
	ds_list_read(global.unlock_wpn,ds_unlock_wpn);
	ds_list_read(global.unlock_arm,ds_unlock_arm);
	ds_list_read(global.unlock_hlm,ds_unlock_hlm);
	
	
	var equip_wpn=ini_read_real("savegame"+string(global.slot),"player_wpn",global.player_weapon.index);
	var equip_arm=ini_read_real("savegame"+string(global.slot),"player_arm",global.player_armor.index);
	var equip_hlm=ini_read_real("savegame"+string(global.slot),"player_hlm",global.player_helm.index);
	
	global.player_weapon=global.weapons[equip_wpn];
	global.player_armor=global.armors[equip_arm];
	global.player_helm=global.helms[equip_hlm];
	
////todo save and load stats
	//global.player_skin=ini_read_real("savegame"+string(global.slot),"skin",global.player_skin);
	//global.player_head=ini_read_real("savegame"+string(global.slot),"head",global.player_head);
	//global.player_hp=ini_read_real("savegame"+string(global.slot),"hp",global.player_hp);
	
	//global.player_weapon=global.weapons[ini_read_real("savegame"+string(global.slot),"weapon",global.player_weapon)];
	//global.player_armor=global.armors[ini_read_real("savegame"+string(global.slot),"armor",global.player_armor)];
	//global.player_helm=global.helms[ini_read_real("savegame"+string(global.slot),"helm",global.player_helm)];
	
ini_close();
}