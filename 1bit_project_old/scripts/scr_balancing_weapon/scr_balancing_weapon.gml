//function scr_balancing_weapon(){

	function weapon_struct(_name, _animset, _price, _weight, _atk_light, _atk_strong, _atk_var, _atk_spd, _bullets, _description, _index) constructor {
		name = _name;
		weapon_animset = _animset;
		price = _price;
		weight = _weight;
		atk_dmg_light = _atk_light;
		atk_dmg_strong = _atk_strong;
		atk_dmg_variation = _atk_var;
		atk_spd = _atk_spd;
		bullets = _bullets;
		description = _description;
		index = _index;
	}

function equip_weapon(_weapon) constructor {
	weapon = new weapon_struct(_weapon.name,_weapon.weapon_animset,_weapon.price,_weapon.weight,_weapon.atk_dmg_light,_weapon.atk_dmg_strong,_weapon.atk_dmg_variation, _weapon.atk_spd, _weapon.bullets,_weapon.description, _weapon.index);
	switch_animset(weapon.weapon_animset);
	scr_balancing();
	return(_weapon);
}

	function weapon_animset_switch(_csv_string){
	
		var this_animset = weapons_animset.null
		
		switch(_csv_string){
			case "weapons.hands": this_animset = weapons_animset.hands break;
			case "weapons.dagger": this_animset = weapons_animset.dagger break;
			case "weapons.sword": this_animset = weapons_animset.sword break;
			case "weapons.staff": this_animset = weapons_animset.stick break;
			case "weapons.katana": this_animset = weapons_animset.katana break;
			case "weapons.shotgun": this_animset = weapons_animset.shotgun break;
			default: this_animset = weapons_animset.null; break;
		}
	
		return this_animset;
	}
	
		function switch_animset(_animset) {
	
		switch _animset
		{
			case weapons_animset.hands:
				weapon_sprite=spr_ui_weapons_hands;
			
				idle_a=idle_fight;
				idle_b=idle_fight;

				attack_charge=attack_charge3_a;
				attack_charge_strong=attack_charge3_b;
				attack_a=attack_3_a;
				attack_b=attack_3_b;
				attack_fr=attack_3_fr;
			
				animset_weapon_image_speed=1;
				animset_atk1_time=8;
				animset_atk2_time=20;
				
				animset_attack_range=12;
				animset_attack_range_strong=15;
				animset_atk1_sp=4;
				animset_atk1_sp_decrease=.3;
				animset_atk2_sp=6;	
				animset_atk2_sp_decrease=.2;
			
			break;
			case weapons_animset.dagger:
				weapon_sprite=spr_ui_weapons_dagger;
				
				idle_a=idle_knife;
				idle_b=idle_knife;

				attack_charge=attack_charge3_a;
				attack_charge_strong=attack_charge3_b;
				attack_a=attack_3_a;
				attack_b=attack_3_b;
				attack_fr=attack_3_fr;
			
				animset_weapon_image_speed=1;
				animset_atk1_time=10;
				animset_atk2_time=40;
				
				animset_attack_range=16;
				animset_attack_range_strong=18;
				animset_atk1_sp=4;
				animset_atk1_sp_decrease=.3;
				animset_atk2_sp=5;	
				animset_atk2_sp_decrease=.4;
			
			break;
			case weapons_animset.sword:
				weapon_sprite=spr_ui_weapons_sword;
				
				idle_a=idle_sword;
				idle_b=idle_sword;
			
				attack_charge=attack_charge1_a;
				attack_charge_strong=attack_charge1_b;
				attack_a=attack_1_a;
				attack_b=attack_1_b;
				attack_fr=attack_1_fr;			
			
				animset_weapon_image_speed=1;
				animset_atk1_time=15;
				animset_atk2_time=40;
				
				animset_attack_range=18;
				animset_attack_range_strong=19;
				animset_atk1_sp=5;
				animset_atk1_sp_decrease=.3;
				animset_atk2_sp=6;	
				animset_atk2_sp_decrease=.4;
			
			break;
			case weapons_animset.stick:
				weapon_sprite=spr_ui_weapons_stick;
				
				idle_a=idle_stick;
				idle_b=idle_stick;
			
				attack_charge=attack_charge2_a;
				attack_charge_strong=attack_charge2_b;
				attack_a=attack_2_a;
				attack_b=attack_2_b;
				attack_fr=attack_2_fr;
			
				animset_weapon_image_speed=1;
				animset_atk1_time=15;
				animset_atk2_time=40;

				animset_attack_range=20;
				animset_attack_range_strong=22;
				animset_atk1_sp=5;
				animset_atk1_sp_decrease=.3;
				animset_atk2_sp=6;	
				animset_atk2_sp_decrease=.4;
			
			break;
			case weapons_animset.katana:
				weapon_sprite=spr_ui_weapons_katana;
				
				idle_a=idle_katana;
				idle_b=idle_katana;
			
				attack_charge=attack_charge_op_a;
				attack_charge_strong=attack_charge_op_b;
				attack_a=attack_op_a;
				attack_b=attack_op_b;
				attack_fr=attack_op_fr;			
			
				animset_weapon_image_speed=1;
				animset_atk1_time=10;
				animset_atk2_time=60;
				
				animset_attack_range=20;
				animset_attack_range_strong=21;
				animset_atk1_sp=6;
				animset_atk1_sp_decrease=.5;
				animset_atk2_sp=8;	
				animset_atk2_sp_decrease=.6;
			
			break;
			case weapons_animset.shotgun:
				weapon_sprite=spr_ui_weapons_shotgun;
				
				idle_a=idle_shotgun;
				idle_b=idle_shotgun;
			
				attack_charge=attack_charge_shotgun_a;
				attack_charge_strong=attack_charge_shotgun_b;
				attack_a=attack_shotgun_a;
				attack_b=attack_shotgun_b;
				attack_fr=attack_shotgun_fr;
			
				animset_weapon_image_speed=1;
				animset_atk1_time=5;
				animset_atk2_time=20;
				
				animset_attack_range=5;//spread for guns
				animset_attack_range_strong=10;//spread for guns
				
				animset_atk1_sp=-4;
				animset_atk1_sp_decrease=.4;
				animset_atk2_sp=-6;	
				animset_atk2_sp_decrease=.5;
			
			break;		
			case weapons_animset.null:
				weapon_sprite=spr_null;
				idle_a=idle_fight;
				idle_b=idle_fight;

				attack_charge=attack_charge3_a;
				attack_charge_strong=attack_charge3_b;
				attack_a=attack_3_a;
				attack_b=attack_3_b;
				attack_fr=attack_3_fr;
				animset_weapon_image_speed=1;
				animset_atk1_time=10;
				animset_atk2_time=20;
				animset_attack_range=12;
				animset_attack_range_strong=15;
				animset_atk1_sp=4;
				animset_atk1_sp_decrease=.3;
				animset_atk2_sp=6;
				animset_atk2_sp_decrease=.2;
			break;		
			default:
			break;		
		}
	}

	
	function csv_weapon_import(csv_File,Array_Var){
		//import a given cvs (csv_File) into a given grid (arg2)
		show_debug_message("IMPORTING WEAPONS DATA")
		global.weapon_index = ds_list_create();
		//Load given csv into temporary grid, values are stred as strings.
		var file_grid = load_csv(csv_File);
		var ww = ds_grid_width(file_grid);
		var hh = ds_grid_height(file_grid);
		array_resize(Array_Var,hh-1);
	
		for (var j = 1; j < hh; j++;)
		{
			//create a new weapon for each row of the csv
			try{
			var this_weapon = new weapon_struct(file_grid[# 1,j], 
			weapon_animset_switch(file_grid[# 2,j]),
			real(file_grid[# 3,j]),
			real(file_grid[# 4,j]),
			real(file_grid[# 5,j]),
			real(file_grid[# 6,j]),
			real(file_grid[# 7,j]),
			real(file_grid[# 8,j]),
			real(file_grid[# 9,j]),
			file_grid[# 10,j],
			real(file_grid[# 0,j]))
			
			array_set(Array_Var, real(file_grid[# 0,j]), this_weapon);
			ds_list_set(global.weapon_index, real(file_grid[# 0,j]), file_grid[# 1,j]);
			show_debug_message(string(this_weapon))}
			catch(e)
			{ show_debug_message("Data error csv line" + string(j+1)+ " weapon n " + file_grid[# 0,j] + ". Please fill blank cell to solve.")}
		}
		//destroy temporary grid
		ds_grid_destroy(file_grid);
		show_debug_message("WEAPON DATA LOADED");
	}

	global.weapons = array_create(1,0);
	csv_weapon_import("CSV 1Bit Elements - Weapons.csv",global.weapons);
//}


#region old code
/*	switch weapon
	{
		case global.weapons[0]:
			weapon.name="bare hands";
			weapon.weight=0;
			weapon.atk_dmg_light=.5;
			weapon.atk_dmg_strong=1;
			weapon.atk_dmg_variation=1;
			weapon.weapon_animset=weapons_animset.hands;
		break;
		case global.weapons[15]:
			weapon.name="rusty dagger";
			weapon.weight=1;
			weapon.atk_dmg_light=1.5;
			weapon.atk_dmg_strong=2;
			weapon.atk_dmg_variation=.75;
			weapon.weapon_animset=weapons_animset.dagger;
		break;
		case global.weapons[22]:
			weapon.name="broken sword";
			weapon.weight=2;
			weapon.atk_dmg_light=2;
			weapon.atk_dmg_strong=3;
			weapon.atk_dmg_variation=.1;
			weapon.weapon_animset=weapons_animset.sword;
		break;
		case global.weapons[32]:
			weapon.name="cracked staff";
			weapon.weight=3;
			weapon.atk_dmg_light=2.5;
			weapon.atk_dmg_strong=3.5;
			weapon.atk_dmg_variation=.15;			
			weapon.weapon_animset=weapons_animset.stick;
		break;
		case global.weapons[44]:
			weapon.name="old katana";
			weapon.weight=.5;
			weapon.atk_dmg_light=2;
			weapon.atk_dmg_strong=4;
			weapon.atk_dmg_variation=.05;
			weapon.weapon_animset=weapons_animset.katana;
		break;
		case global.weapons[47]:
			weapon.name="extreme katana";
			weapon.weight=0.3;
			weapon.atk_dmg_light=3;
			weapon.atk_dmg_strong=6;
			weapon.atk_dmg_variation=1;
			weapon.weapon_animset=weapons_animset.katana;
		break;
		case global.weapons[0]:
			weapon.name="busted shotgun";
			weapon.weight=5;
			weapon.atk_dmg_light=2;
			weapon.atk_dmg_strong=3;
			weapon.atk_dmg_variation=.1;
			weapon.bullets=3;
			weapon.weapon_animset=weapons_animset.shotgun;
		break;
		default:
		break;
	}
	*/
#endregion