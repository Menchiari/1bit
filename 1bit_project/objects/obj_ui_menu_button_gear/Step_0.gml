if mouse_check_button(mb_any) && collision_point(mouse_x,mouse_y,self,true,false) {selected=true;}
else {selected=false;}
if mouse_check_button_released(mb_any)
{
	if point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width/3.5,y+sprite_height)
	{
		wpn_button_select-=1;
		if wpn_button_select==-1 {wpn_button_select=ds_list_size(global.unlock_wpn)-1;} //{wpn_button_select=global.unlock_wpn-1;}
		arm_button_select-=1;
		if arm_button_select==-1 {arm_button_select=ds_list_size(global.unlock_arm)-1;}
		hlm_button_select-=1;
		if hlm_button_select==-1 {hlm_button_select=ds_list_size(global.unlock_hlm)-1;}
	}
	if point_in_rectangle(mouse_x,mouse_y,x+sprite_width/3.5,y,x+sprite_width,y+sprite_height) 
	{
		wpn_button_select+=1;
		if wpn_button_select = ds_list_size(global.unlock_wpn) {wpn_button_select = 0;}
		
		arm_button_select+=1;
		if arm_button_select = ds_list_size(global.unlock_arm) {arm_button_select = 0;}
		
		hlm_button_select+=1;
		if hlm_button_select = ds_list_size(global.unlock_hlm) {hlm_button_select = 0;}
	}
	
}

switch(type)
{
	case 0://weapon
		//switch wpn_button_select
		//{
			
		//	//case 0: global.player_weapon=global.weapons[0]; break;
			
		//	//case 1: if global.unlock_wpn<=1 wpn_button_select+=1 else global.player_weapon=global.weapons[wpn1]; break;
		//	//case 2: if global.unlock_wpn<=2 wpn_button_select+=1 else global.player_weapon=global.weapons[wpn2]; break;
		//	//case 3: if global.unlock_wpn<=3 wpn_button_select+=1 else global.player_weapon=global.weapons[wpn3]; break;
		//	//case 4: if global.unlock_wpn<=4 wpn_button_select+=1 else global.player_weapon=global.weapons[wpn4]; break;
		//	//case 5: if global.unlock_wpn<=5 wpn_button_select+=1 else global.player_weapon=global.weapons[wpn5]; break;
		//	//default: wpn_button_select=0; break;
		//}
		//var selected_wpn = ds_list_find_value(global.unlock_wpn,wpn_button_select);
		
		global.player_weapon=global.weapons[ds_list_find_value(global.unlock_wpn,wpn_button_select)];
		text=global.player_weapon.name;
	break;
	case 1://armor
		//switch arm_button_select
		//{
		//	case 0: global.player_armor=global.armors[0]; break;
			
		//	case 1: if global.unlock_arm<=1 arm_button_select+=1 else global.player_armor=global.armors[arm1]; break;
		//	case 2: if global.unlock_arm<=2 arm_button_select+=1 else global.player_armor=global.armors[arm2]; break;
		//	case 3: if global.unlock_arm<=3 arm_button_select+=1 else global.player_armor=global.armors[arm3]; break;
		//	case 4: if global.unlock_arm<=4 arm_button_select+=1 else global.player_armor=global.armors[arm4]; break;
		//	case 5: if global.unlock_arm<=5 arm_button_select+=1 else global.player_armor=global.armors[arm5]; break;
		//	default: arm_button_select=0; break;
		//}
		global.player_armor=global.armors[ds_list_find_value(global.unlock_arm,arm_button_select)];
		
		text=global.player_armor.name;
	break;
	case 2://helm
		//switch hlm_button_select
		//{
		//	case 0: global.player_helm=global.helms[0]; break;
			
		//	case 1: if global.unlock_hlm<=1 hlm_button_select+=1 else global.player_helm=global.helms[hlm1]; break;
		//	case 2: if global.unlock_hlm<=2 hlm_button_select+=1 else global.player_helm=global.helms[hlm2]; break;
		//	case 3: if global.unlock_hlm<=3 hlm_button_select+=1 else global.player_helm=global.helms[hlm3]; break;
		//	case 4: if global.unlock_hlm<=4 hlm_button_select+=1 else global.player_helm=global.helms[hlm4]; break;
		//	case 5: if global.unlock_hlm<=5 hlm_button_select+=1 else global.player_helm=global.helms[hlm5]; break;
		//	default: hlm_button_select=0; break;
		//}
		global.player_helm = 	global.helms[ds_list_find_value(global.unlock_hlm,hlm_button_select)];
		
		text=global.player_helm.name;
	break;
	default: break;
	case 3://awaken
	break;
}
	
if instance_exists(obj_character)
{
	with obj_character
	{
		scr_init_hero();
	}
	//weapon.name=obj_character.weapon.name;
	//armor.name=obj_character.armor.name;
	//helm_name=obj_character.helm.name;
}
