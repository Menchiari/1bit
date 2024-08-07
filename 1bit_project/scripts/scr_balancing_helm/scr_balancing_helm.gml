#region old code
/*function scr_balancing_helm(){
	switch helm
	{
		////////////////////////////////////
		case global.helms[0]:
			helm.name="no headwear";
			helm.sprite=character_head;
			helm.defence=1;
			helm.weight=0;
		break;
		case global.helms[1]:
			helm.name="stray hat";
			helm.sprite=spr_helm_strayhat1;
			helm.defence=1.05;
			helm.weight=0.5;
		break;
		case global.helms[19]:
			helm.name="guard helm";
			helm.sprite=spr_helm_small1;
			helm.defence=1.15;
			helm.weight=1;
		break;		
		case global.helms[24]:
			helm.name="knight helm";
			helm.sprite=spr_helm_small2;
			helm.defence=1.3;
			helm.weight=2;
		break;
		case global.helms[16]:
			helm.name="rusty helm";
			helm.sprite=spr_helm_rusty;
			helm.defence=1.5;
			helm.weight=3;
		break;
		case global.helms[21]:
			helm.name="roman helm";
			helm.sprite=spr_helm_roman;
			helm.defence=2;
			helm.weight=4;
		break;
		case global.helms[26]:
			helm.name="bishop crown";
			helm.sprite=spr_helm_bishop;
			helm.defence=2.3;
			helm.weight=5;
		break;
		case global.helms[9]:
			helm.name="dirty hood";
			helm.sprite=spr_helm_hood;
			helm.defence=1.1;
			helm.weight=.1;
		break;
		////////////////////////////////////
		default:
			helm=global.helms[0];
			helm.name="no headwear";
			helm.sprite=character_head;
			helm.defence=1;
			helm.weight=0;
		break;
	}
}
*/
//new shit starts here
//delete or commet upward when finished downward
#endregion

function helm_struct(_name, _price, _weight, _defence, _charisma, _sprite, _description, _index) constructor {
	name = _name;
	price = _price;
	defence = _defence;
	weight = _weight;
	charisma = _charisma;
	sprite = _sprite;
	description = _description;
	index = _index;

}

function equip_helm(_helm) constructor{
	//show_debug_message("Equipping: "+string(_helm))
	helm = new helm_struct(_helm.name,_helm.price,_helm.weight,_helm.defence,_helm.charisma,_helm.sprite,_helm.description, _helm.index);
	if helm.sprite = undefined || _helm.name = "no headwear"
	{helm.sprite =  character_head;}
	sprite_set_offset(helm.sprite,14,10);
	sprite_set_speed(helm.sprite,0,spritespeed_framespersecond);
	scr_balancing();
	//show_debug_message("Equipped: "+string(helm))
	//show_debug_message("Original: "+string(_helm))
}

function helm_sprite_switch(_csv_string) {
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


function csv_helm_import(csv_File,Array_Var){
	//import a given cvs (csv_File) into a given grid (arg2)
	show_debug_message("IMPORTING HELM DATA")
	global.helm_index = ds_list_create();
	//Load given csv into temporary grid, values are stred as strings.
	var file_grid = load_csv(csv_File);
	var ww = ds_grid_width(file_grid);
	var hh = ds_grid_height(file_grid);
	array_resize(Array_Var,hh-1);
	
	for (var j = 1; j < hh; j++;)
	{
		//create a new weapon for each row of the csv
		try{
		var this_helm = new helm_struct(file_grid[# 1,j], 
		real(file_grid[# 2,j]),
		real(file_grid[# 4,j]),
		real(file_grid[# 3,j]),
		real(file_grid[# 5,j]),
		helm_sprite_switch(file_grid[# 6,j]),
		file_grid[# 7,j],
		real(file_grid[# 0,j]))
		array_set(Array_Var, real(file_grid[# 0,j]), this_helm);
		ds_list_set(global.helm_index, real(file_grid[# 0,j]), file_grid[# 1,j]);
		show_debug_message(string(this_helm))}
		catch(e)
		{ show_debug_message("Data error csv line" + string(j+1)+ " helm n " + file_grid[# 0,j] + ". Please fill blank cell to solve.")}
	}
	//destroy temporary grid
	ds_grid_destroy(file_grid);
	show_debug_message("HELM DATA LOADED");
}


global.helms = array_create(1,0);
csv_helm_import("CSV 1Bit Elements - Helm.csv",global.helms);