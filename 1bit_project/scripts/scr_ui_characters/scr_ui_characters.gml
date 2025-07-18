function scr_ui_characters()
{
	switch character_select
	{
		case 0:
			character_face=beard;
			character_name="Kan";
			character_description="from the north";
			character_head_var=spr_head_beard1;
			character_body_var=spr_body_naked;
			global.player_str_mod=1.1;
			global.player_res_mod=1;
			global.player_spd_mod=0.9;
			//global.player_str=ds_list_find_value(global.lvl_str,0)*1.25;
			//global.player_res=ds_list_find_value(global.lvl_res,0)*1.25;
			//global.player_spd=ds_list_find_value(global.lvl_spd,0)*0.9;
		break;
		case 1:
			character_face=spr_avatar_ara;
			character_name="Ara";
			character_description="from the west";
			character_head_var=spr_head_female2;
			character_body_var=spr_body_naked;
			global.player_str_mod=1;
			global.player_res_mod=1;
			global.player_spd_mod=1;
			//global.player_str=ds_list_find_value(global.lvl_str,0)*1;
			//global.player_res=ds_list_find_value(global.lvl_res,0)*1;
			//global.player_spd=ds_list_find_value(global.lvl_spd,0)*1;
		break;
		case 2:
			character_face=spr_avatar_meu;
			character_name="Meu";
			character_description="from the east";
			character_head_var=spr_head_female;
			character_body_var=spr_body_naked;
			global.player_str_mod=1.1;
			global.player_res_mod=0.8;
			global.player_spd_mod=1.1;
			//global.player_str=ds_list_find_value(global.lvl_str,0)*1.1;
			//global.player_res=ds_list_find_value(global.lvl_res,0)*0.8;
			//global.player_spd=ds_list_find_value(global.lvl_spd,0)*1.1;
		break;
		case 3:
			character_face=spr_avatar_joy;
			character_name="Joy";
			character_description="from the south";
			character_head_var=spr_head_female1;
			character_body_var=spr_body_naked;
			global.player_str_mod=0.9;
			global.player_res_mod=0.9;
			global.player_spd_mod=1.2;
			//global.player_str=ds_list_find_value(global.lvl_str,0)*0.9;
			//global.player_res=ds_list_find_value(global.lvl_res,0)*0.9;
			//global.player_spd=ds_list_find_value(global.lvl_spd,0)*1.2;
		break;
		case 4:
			character_face=spr_avatar_skull;
			character_name="hel";
			character_description="from above";
			character_head_var=spr_head_skull;
			character_body_var=spr_body_skeleton;
			global.player_str_mod=1.25;
			global.player_res_mod=1;
			global.player_spd_mod=0.75;
			//global.player_str=ds_list_find_value(global.lvl_str,0)*1.5;
			//global.player_res=ds_list_find_value(global.lvl_res,0)*1;
			//global.player_spd=ds_list_find_value(global.lvl_spd,0)*0.75;
		break;
		case 5:
			character_face=spr_avatar_zombie;
			character_name="rot";
			character_description="from below";
			character_head_var=spr_head_infected;
			character_body_var=spr_body_infected;
			global.player_str_mod=1;
			global.player_res_mod=1.25;
			global.player_spd_mod=0.75;
			//global.player_str=ds_list_find_value(global.lvl_str,0)*1;
			//global.player_res=ds_list_find_value(global.lvl_res,0)*1.5;
			//global.player_spd=ds_list_find_value(global.lvl_spd,0)*.75;
		break;
		case 6:
			character_face=spr_avatar_god;
			character_name="gai";
			character_description="from eternity";
			character_head_var=spr_head;
			character_body_var=spr_body_naked;
			global.player_str_mod=1;
			global.player_res_mod=1;
			global.player_spd_mod=1;
			//global.player_str=ds_list_find_value(global.lvl_str,0)*1.5;
			//global.player_res=ds_list_find_value(global.lvl_res,0)*.75;
			//global.player_spd=ds_list_find_value(global.lvl_spd,0)*1.25;
		break;
		default:
		break;
	}
	
	global.player_head=character_head_var;
	//global.player_skin=character_body_var;
	if instance_exists(obj_hero)
	{
		obj_hero.character_head=character_head_var;
		obj_hero.character_body=character_body_var;
		obj_hero.str=global.player_str*global.player_str_mod;
		obj_hero.res=global.player_res*global.player_res_mod;
		obj_hero.spd=global.player_spd*global.player_spd_mod;
	}
	
	//show_debug_message("XP: " + string(global.xp));
	//show_debug_message("Player Res: " + string(global.player_res));
	//show_debug_message("Stat list size: " + string(ds_list_size(global.lvl_res)));
	//show_debug_message("XP chart size: " + string(ds_list_size(global.lvl_xp)));
}