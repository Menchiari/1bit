function scr_loadgame(){
if file_exists("save.sav")
	{
	ini_open("save.sav")
		global.room_list=ini_read_real("savegame"+string(global.slot),"roomlist",global.room_list);
		global.chosen_room=ini_read_real("savegame"+string(global.slot),"room",global.chosen_room);
	
		global.player_lives=ini_read_real("savegame"+string(global.slot),"lives",global.player_lives);
		global.player_head=ini_read_real("savegame"+string(global.slot),"player_head",global.player_head);
		
		//LEVEL UP AND XP//
		global.xp=ini_read_real("savegame"+string(global.slot),"xp",global.xp);
		global.lvl_hp=ini_read_real("savegame"+string(global.slot),"player_lvl_hp",global.lvl_hp);
		global.lvl_str=ini_read_real("savegame"+string(global.slot),"player_lvl_str",global.lvl_str);
		global.lvl_res=ini_read_real("savegame"+string(global.slot),"player_lvl_res",global.lvl_res);
		global.lvl_spd=ini_read_real("savegame"+string(global.slot),"player_lvl_spd",global.lvl_spd);

		global.player_hp_max=ini_read_real("savegame"+string(global.slot),"player_hp",global.player_hp_max);
		global.player_str=ini_read_real("savegame"+string(global.slot),"player_str",global.player_str);
		global.player_res=ini_read_real("savegame"+string(global.slot),"player_res",global.player_res);
		global.player_spd=ini_read_real("savegame"+string(global.slot),"player_spd",global.player_spd);
		///////////////////
		
		global.deathcount=ini_read_real("savegame"+string(global.slot),"deathcount",global.deathcount);
		global.face_progress=ini_read_real("savegame"+string(global.slot),"faceprogress",global.face_progress);
		global.story_progress=ini_read_real("savegame"+string(global.slot),"storyprogress",global.story_progress);
	
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
if file_exists("save_death.sav")
	{
	ini_open("save_death.sav")
		global.face_progress_death=ini_read_real("savegame"+string(global.slot),"faceprogressdeath",global.face_progress_death);
		global.allheads=ini_read_real("savegame"+string(global.slot),"allheads",global.allheads);
	ini_close();
	}
}