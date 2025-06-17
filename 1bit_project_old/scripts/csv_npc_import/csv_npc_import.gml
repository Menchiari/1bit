// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#region npc import and stuff

function npc_struct(_obj_name, _name,_hp,_str,_res,_spd,_char,_weapon,_armor,_helm,_theme,_points,_count) constructor{
	obj_name = _obj_name;
	name = _name;
	hp = _hp;
	str = _str;
	res = _res;
	spd = _spd;
	cha = _char;
	weapon = _weapon;
	armor = _armor;
	helm = _helm;
	theme = _theme;
	points = _points;
	count = _count;
}


function csv_npc_import() constructor {
	#region npc csv import & theme
	show_debug_message("IMPORTING NPC DATA")
	global.NPCs = array_create(1,0);
	//Load given csv into temporary grid, values are stred as strings.
	var csv_file = "CSV 1Bit Elements - Characters_RPG.csv";
	var Array_Var = global.NPCs;
	var file_grid = load_csv(csv_file);
	var ww = ds_grid_width(file_grid);
	var hh = ds_grid_height(file_grid);
	array_resize(Array_Var,hh-1);
	global.theme_list = ds_list_create();
	
	var theme = "";
	var start = 0;
	var finish = 0;
	
	
	for (var j = 1; j < hh; j++;)
	{
		
		if theme != file_grid[# 11,j] //if ds_list_find_index(global.theme_list,file_grid[# 11,j]) = -1
		{theme = file_grid[# 11,j]; start = real(file_grid[# 0,j]);}
		
		if (file_grid[# 11,j+1] != theme )
		{
			finish = real(file_grid[# 0,j]);
			ds_list_add(global.theme_list, new theme_strct(theme,start,finish))
		}
		
		
		//create a new character for each row of the csv
		try{
		var this_npc = new npc_struct(asset_get_index(file_grid[# 1,j]), //obj name
		file_grid[# 2,j],			//name
		real(file_grid[# 3,j]),		//hp
		real(file_grid[# 4,j]),		//str
		real(file_grid[# 5,j]),		//res
		real(file_grid[# 6,j]),		//spd
		file_grid[# 7,j],			//cha
		file_grid[# 8,j],			//weapon
		file_grid[# 9,j],			//armor
		file_grid[# 10,j],			//helm
		file_grid[# 11,j],			//theme
		real(file_grid[# 12,j]))	//points
		array_set(Array_Var, real(file_grid[# 0,j]), this_npc);
		show_debug_message(string(this_npc))}
		catch(e)
		{ show_debug_message("Data error csv line" + string(j+1)+ " NPC n " + file_grid[# 0,j] + ". Please fill blank cell to solve.")}
	
	
	
	}
	var extra = 2;//numbere of extra theme after the last region's theme in the csv.
	for (var r = 0; r < round((ds_list_size(global.theme_list)-extra)/3) ; r++)
	{
		global.region_array[r] = new region_struct( ds_list_find_value(global.theme_list,r*3+1),
													ds_list_find_value(global.theme_list,r*3+2),
													ds_list_find_value(global.theme_list,r*3+3))		
	}

	for (var i = 0; i < array_length(global.region_array); i++)
	{
		show_debug_message(string(global.region_array[i]))
	}
	
	show_debug_message("Theme Loaded")
	
	//destroy temporary grid
	ds_grid_destroy(file_grid);
	show_debug_message("NPC DATA LOADED");
	#endregion
	
	#region npc_count csv import & theme
	show_debug_message("IMPORTING NPC_count DATA")
	global.NPC_count = array_create(1,0);
	//Load given csv into temporary grid, values are stred as strings.
	var csv_file = "CSV 1Bit Elements - Characters_count.csv";
	var Array_Var = global.NPC_count;
	var file_grid = load_csv(csv_file);
	var ww = ds_grid_width(file_grid);
	var hh = ds_grid_height(file_grid);
	array_resize(Array_Var,hh-1);
	global.theme_count_list = ds_list_create();
	
	var theme = "";
	var start = 0;
	var finish = 0;
	
	
	for (var j = 1; j < hh; j++;)
	{
		
		if theme != file_grid[# 11,j] //if ds_list_find_index(global.theme_list,file_grid[# 11,j]) = -1
		{theme = file_grid[# 11,j]; start = real(file_grid[# 0,j]);}
		
		if (file_grid[# 11,j+1] != theme )
		{
			finish = real(file_grid[# 0,j]);
			ds_list_add(global.theme_count_list, new theme_strct(theme,start,finish))
		}
		
		
		//create a new character for each row of the csv
		try{
		var this_npc = new npc_struct(asset_get_index(file_grid[# 1,j]), //obj name
		file_grid[# 2,j],			//name
		real(file_grid[# 3,j]),		//hp
		real(file_grid[# 4,j]),		//str
		real(file_grid[# 5,j]),		//res
		real(file_grid[# 6,j]),		//spd
		file_grid[# 7,j],			//cha
		file_grid[# 8,j],			//weapon
		file_grid[# 9,j],			//armor
		file_grid[# 10,j],			//helm
		file_grid[# 11,j],			//theme
		real(file_grid[# 12,j]),	//points
		real(file_grid[# 13,j]))	//max count
		array_set(Array_Var, real(file_grid[# 0,j]), this_npc);
		show_debug_message(string(this_npc))}
		catch(e)
		{ show_debug_message("Data error csv line" + string(j+1)+ " NPC n " + file_grid[# 0,j] + ". Please fill blank cell to solve.")}
	
	
	
	}
	for (var i = 0; i < ds_list_size(global.theme_count_list); i++)
	{
		show_debug_message("Theme Count    "+string( ds_list_find_value(global.theme_count_list,i))+" "+string(i))
	}
	show_debug_message("Theme Count Loaded")
	
	//destroy temporary grid
	ds_grid_destroy(file_grid);
	show_debug_message("NPC Count DATA LOADED");
	#endregion
	
	
}

function spawn_npc_test(_x, _y, _rnd_npc,_npc_list) constructor{
	var _npc = _npc_list[_rnd_npc]
	
	var npc_obj = _npc.obj_name;
	if npc_obj = -1 {npc_obj = this_npc; show_debug_message("Error Spawning " + string(_npc.name)+", object does not exist. Base enemy spawned instead.");}
	
	var this_npc = instance_create_depth(_x,_y,-y,npc_obj);
	
	this_npc.hp_max=_npc.hp;
	this_npc.hp=_npc.hp;
	this_npc.res=_npc.res;
	this_npc.str=_npc.str;
	this_npc.spd=_npc.spd;
	this_npc.cha=_npc.cha;
	this_npc.name=_npc.name;
	show_debug_message("Spawned @ " +string(_x)+":"+string(_y)+" "+string(_npc));
	with (this_npc)
	{
		equip_armor(global.armors[ds_list_find_index(global.armor_index,_npc.armor)])
		equip_helm(global.helms[ds_list_find_index(global.helm_index,_npc.helm)])
		equip_weapon(global.weapons[ds_list_find_index(global.weapon_index,_npc.weapon)])
	}
	
	return this_npc;
}
	
#endregion	

#region levelling treshold import and stuff
	
function csv_level_import(csv_file) constructor {
	var file_grid = load_csv(csv_file);
	var ww = ds_grid_width(file_grid);
	var hh = ds_grid_height(file_grid);

	global.lvl_hp = ds_list_create();
	global.lvl_str = ds_list_create();
	global.lvl_res = ds_list_create();
	global.lvl_spd = ds_list_create();
	global.lvl_xp = ds_list_create();



	for (var j = 2; j < hh; j++;)
	{
		
		ds_list_add(global.lvl_hp,  real(file_grid[# 1,j]));
		ds_list_add(global.lvl_str, real(file_grid[# 4,j]));
		ds_list_add(global.lvl_res, real(file_grid[# 7,j]));
		ds_list_add(global.lvl_spd, real(file_grid[# 10,j]));
		ds_list_add(global.lvl_xp,  real(file_grid[# 13,j]));	
		
		//show_debug_message("Lvl"+string(real(file_grid[# 0,j]))+": hp:"+string(real(file_grid[# 4,j])))
	}
	
	//cleanup
	ds_grid_destroy(file_grid);
}


function get_lvl(_stat_list, _player_stat) constructor {
	
	var current_lvl = ds_list_find_index(_stat_list, _player_stat);
	
	return current_lvl;
}

function get_lvl_gain(_stat_list, _player_stat) {

	var xp = global.xp;
	var current_lvl = get_lvl(_stat_list, _player_stat);
	var lvl_gain = 0;
	// ds_list_find_value(global.lvl_xp, jjj)
	do{
		xp -= ds_list_find_value(global.lvl_xp,current_lvl);
		lvl_gain += 1;
		current_lvl +=1;
		show_debug_message("Lvl"+string(lvl_gain))
	}
	until(xp < 0)

	return lvl_gain-1;

}

function get_xp_cost(_current_lvl, _lvl_gain) constructor{
	var xp_cost = 0;
	
	if _lvl_gain = 0
	{return xp_cost;}
	else
	{
		for(var i = 0; i < _lvl_gain ; i++) 
		{
			xp_cost += ds_list_find_value(global.lvl_xp,_current_lvl+i);
		}
		show_debug_message("XP cost:"+string(xp_cost))
		return xp_cost;
	}

}
#endregion

function decor_struct(_sprite, _type) constructor
{
	if _sprite = -1
	{sprite = spr_null;}
	else
	{sprite = _sprite;}
	type = _type;
}

function csv_decor_import(csv_file) constructor
{
	var file_grid = load_csv(csv_file);
	var ww = ds_grid_width(file_grid);
	var hh = ds_grid_height(file_grid);

	
	 global.decor_map = 0
	 
	 //for(var i = 0; i < ds_list_size(global.theme_list); i++)
	 //{
		// ds_map_add(global.decor_map,ds_list_find_value(global.theme_list, i),0);
	 //}
	 
	 
	 
	for (var j = 1; j < hh; j++;)
	
	{
		global.decor_map[j-1][0] = file_grid[# 0,j];
		global.decor_map[j-1][1] = file_grid[# 1,j];
		global.decor_map[j-1][2] = file_grid[# 2,j];
	}
	
	ds_grid_destroy(file_grid);
	
}


function pick_decor(_theme) constructor 
{
	var rnd;
	do
	{
		rnd =  irandom_range(0, array_length(global.decor_map)-1);
		//show_debug_message(string(global.decor_map[rnd][1]))
		//show_debug_message(string(_theme))
	}
	until (global.decor_map[rnd][1] = _theme.name)
	
	return rnd;
	
}


