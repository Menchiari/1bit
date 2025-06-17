//function scr_balancing_armor(){
#region old code
	/*switch armor
	{
//Main Armors
		case global.armors[0]:
			armor.name="naked";
			sprite_body=character_body;
			armor.defence=.5;
			armor.weight=0;
		break;
		case global.armors[7]:
			armor.name="warm pelt";
			sprite_body=spr_body_pelt;
			armor.defence=1.05;
			armor.weight=2;
		break;
		case global.armors[16]:
			armor.name="rusty chainmail";
			sprite_body=spr_body_chainmail;
			armor.defence=1.15;
			armor.weight=8;
		break;
		case global.armors[22]:
			armor.name="metal plate";
			sprite_body=spr_body_metal;
			armor.defence=1.25;
			armor.weight=25;
		break;
		case global.armors[23]:
			armor.name="heavy metal armor";
			sprite_body=spr_body_metal;
			armor.defence=2.5;
			armor.weight=35;
		break;
		case global.armors[25]:
			armor.name="golden armor";
			sprite_body=spr_body_angel;
			armor.defence=3;
			armor.weight=45;
		break;
		case global.armors[9]:
			armor.name="resiliant vest";
			sprite_body=spr_body_vest;
			armor.defence=1.3;
			armor.weight=1;
		break;
		
///NPC And Enemy related armors
		case global.armors[2]:
			armor.name="crusader vest";
			sprite_body=spr_body_crusader;
			armor.defence=1.05;
			armor.weight=3;
		break;
		case global.armors[2]:
			armor.name="rib cage";
			sprite_body=spr_body_skeleton;
			armor.defence=1;
			armor.weight=40;
		break;
		case global.armors[2]:
			armor.name="infected clothes";
			sprite_body=spr_body_infected;
			armor.defence=1.25;
			armor.weight=0;
		break;
		case global.armors[2]:
			armor.name="cape";
			sprite_body=spr_body_cape;
			armor.defence=.666;
			armor.weight=0;
		break;

		default:
			armor.name="shirtless";
			sprite_body=spr_null;
			armor.defence=1;
			defence_speed=1;
			armor.weight=1.5;
		break;
	}
}
*/
//new shit starts here
//delete or commet upward when finished downward
#endregion

function armor_struct(_name, _price, _weight, _defence, _charisma, _sprite, _description, _index) constructor {
	name = _name;
	price = _price;
	defence = _defence;
	weight = _weight;
	charisma = _charisma;
	sprite = _sprite;
	description = _description;
	index = _index;

}

function equip_armor(_armor) constructor{
	armor =  new armor_struct(_armor.name,_armor.price,_armor.weight,_armor.defence,_armor.charisma,_armor.sprite,_armor.description, _armor.index);
	if armor.sprite = undefined || _armor.name = "naked"
	{armor.sprite = character_body;}
	sprite_body = armor.sprite;
	sprite_set_offset(sprite_body,13,13);
	sprite_set_speed(sprite_body,0,spritespeed_framespersecond);
	scr_balancing();
}

function armor_sprite_switch(_csv_string) {
	try{
		var this_sprite = asset_get_index(_csv_string);
		if (this_sprite = -1)
		{return undefined;}
		else
		{return this_sprite;}
	}
	catch(e)
	{return undefined}
}


function csv_armor_import(csv_File,Array_Var){
	//import a given cvs (csv_File) into a given grid (arg2)
	show_debug_message("IMPORTING ARMOR DATA")
	global.armor_index = ds_list_create();
	//Load given csv into temporary grid, values are stred as strings.
	var file_grid = load_csv(csv_File);
	var ww = ds_grid_width(file_grid);
	var hh = ds_grid_height(file_grid);
	array_resize(Array_Var,hh-1);
	
	for (var j = 1; j < hh; j++;)
	{
		//create a new weapon for each row of the csv
		try{
		var this_armor = new armor_struct(file_grid[# 1,j], 
		real(file_grid[# 2,j]),
		real(file_grid[# 4,j]),
		real(file_grid[# 3,j]),
		real(file_grid[# 5,j]),
		armor_sprite_switch(file_grid[# 6,j]),
		file_grid[# 7,j],
		real(file_grid[# 0,j]))
		array_set(Array_Var, real(file_grid[# 0,j]), this_armor);
		ds_list_set(global.armor_index, real(file_grid[# 0,j]), file_grid[# 1,j]);
		show_debug_message(string(this_armor))}
		catch(e)
		{ show_debug_message("Data error csv line" + string(j+1)+ " armor n " + file_grid[# 0,j] + ". Please fill blank cell to solve.")}
	}
	//destroy temporary grid
	ds_grid_destroy(file_grid);
	show_debug_message("ARMOR DATA LOADED");
}

global.armors = array_create(1,0);
csv_armor_import("CSV 1Bit Elements - Armor.csv",global.armors);
//}