function scr_savegame(){
ini_open("save.sav")
	ini_write_real("savegame"+string(global.slot),"roomlist",global.room_list);
	ini_write_real("savegame"+string(global.slot),"room",global.chosen_room);

	ini_write_real("savegame"+string(global.slot),"xp",global.xp);
	ini_write_real("savegame"+string(global.slot),"lives",global.player_lives);
	ini_write_real("savegame"+string(global.slot),"deathcount",global.deathcount);
	
	var ds_unlock_wpn = ds_list_write(global.unlock_wpn);
	var ds_unlock_arm = ds_list_write(global.unlock_arm);
	var ds_unlock_hlm = ds_list_write(global.unlock_hlm);
	ini_write_string("savegame"+string(global.slot),"unlock_wpn",ds_unlock_wpn);
	ini_write_string("savegame"+string(global.slot),"unlock_arm",ds_unlock_arm);
	ini_write_string("savegame"+string(global.slot),"unlock_hlm",ds_unlock_hlm);
	//todo check clear list potential memory leak
	
	ini_write_real("savegame"+string(global.slot),"player_wpn",global.player_weapon.index);
	ini_write_real("savegame"+string(global.slot),"player_arm",global.player_armor.index);
	ini_write_real("savegame"+string(global.slot),"player_hlm",global.player_helm.index);
	
ini_close();
}



/////////////////////////////EXPERIMENTAL///////////////////////////////
// Note: the '|' is important, that tells gamemaker that it's a ds_list
// and not a normal array.
//data=ds_list_create();
//data[|stats.name]="Bru"; // player name
//data[|1]=87; // Health
//data[|2]=24; // Mana

//// Saving
//var path="save.txt"; // The path to the file
//var data_string=ds_list_write(data);
//var file=file_text_open_write(path);
//file_text_write_string(file,data_string);
//file_text_close(file);

//// Loading
//var path = "save.sav"; // The path to the file
//var file = file_text_open_read( path );
//var data_string = file_text_read_string( file );
//file_text_close( file );
//ds_list_read( data, data_string );
