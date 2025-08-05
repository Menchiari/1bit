if mouse_check_button(mb_any) && collision_point(mouse_x,mouse_y,self,true,false) {selected=true;}
else {selected=false;}



if mouse_check_button_released(mb_any)
|| nextclick==true
{
	nextclick=false;
	if point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width/3.5,y+sprite_height)
	{
		scr_audio_play(snd_click,global.audio_ui*.3,1);

		wpn_button_select-=1;
		if wpn_button_select==-1 {wpn_button_select=ds_list_size(global.unlock_wpn)-1;} //{wpn_button_select=global.unlock_wpn-1;}
		arm_button_select-=1;
		if arm_button_select==-1 {arm_button_select=ds_list_size(global.unlock_arm)-1;}
		hlm_button_select-=1;
		if hlm_button_select==-1 {hlm_button_select=ds_list_size(global.unlock_hlm)-1;}
	}
	if point_in_rectangle(mouse_x,mouse_y,x+sprite_width/3.5,y,x+sprite_width,y+sprite_height) 
	{
		scr_audio_play(snd_click,global.audio_ui*.3,1.1);
		
		wpn_button_select+=1;
		if wpn_button_select == ds_list_size(global.unlock_wpn) {wpn_button_select = 0;}
		
		arm_button_select+=1;
		if arm_button_select == ds_list_size(global.unlock_arm) {arm_button_select = 0;}
		
		hlm_button_select+=1;
		if hlm_button_select == ds_list_size(global.unlock_hlm) {hlm_button_select = 0;}
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
			////AUDIO
			//var _pitch=clamp(2-(global.player_weapon.weight/10),.75,2);
			//var _vol_wpn=global.audio_ui*.1;
			//if global.player_weapon.weapon_animset==weapons_animset.dagger {audio_play_sound(snd_equip_knife,10,false,_vol_wpn,0,_pitch);}
			//if global.player_weapon.weapon_animset==weapons_animset.sword {audio_play_sound(snd_equip_sword,10,false,_vol_wpn,0,_pitch);}
			//if global.player_weapon.weapon_animset==weapons_animset.katana {audio_play_sound(snd_equip_sword,10,false,_vol_wpn,0,_pitch);}
			//if global.player_weapon.weapon_animset==weapons_animset.stick {audio_play_sound(snd_equip_stick,10,false,_vol_wpn,0,_pitch);}
			//if global.player_weapon.weapon_animset==weapons_animset.shotgun {audio_play_sound(snd_equip_shotgun,10,false,_vol_wpn,0,_pitch);}
			//show_debug_message("audio weapon sound");
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
			//AUDIO
			//var _pitch_arm=clamp(1.5-(global.player_armor.weight/50),.75,1.5);
			//var _vol_arm=global.audio_ui*.5;

			//if global.player_armor.material==armors_material.cloth {audio_play_sound(snd_equip_cloth,2,false,_vol_arm,0,_pitch_arm);}
			//if global.player_armor.material==armors_material.leather {audio_play_sound(snd_equip_vest,2,false,_vol_arm,0,_pitch_arm);}
			//if global.player_armor.material==armors_material.cape {audio_play_sound(snd_equip_cape,2,false,_vol_arm,0,_pitch_arm);}
			//if global.player_armor.material==armors_material.ceramic {audio_play_sound(snd_equip_vest,2,false,_vol_arm,0,_pitch_arm);}
			//if global.player_armor.material==armors_material.chainmail {audio_play_sound(snd_equip_chainmail,2,false,_vol_arm,0,_pitch_arm);show_debug_message("CHAINMAIL!!!")}
			//if global.player_armor.material==armors_material.metal_thin {audio_play_sound(snd_equip_armor,2,false,_vol_arm,0,_pitch_arm);}
			//if global.player_armor.material==armors_material.metal_thick {audio_play_sound(snd_equip_armor,2,false,_vol_arm,0,_pitch_arm);}
			//if global.player_armor.material==armors_material.wood {audio_play_sound(snd_equip_vest,2,false,_vol_arm,0,_pitch_arm);}
			//show_debug_message("audio armor sound for "+string(global.player_armor.material)+string(armors_material.cape));
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
			//AUDIO
			//var _pitch_hlm=clamp(1+(global.player_helm.weight/10),1,1.5);
			//var _vol_hlm=global.audio_ui*.5;
			//audio_play_sound(snd_equip_hlm,10,false,_vol_hlm,0,_pitch_hlm);
			//show_debug_message("audio helm sound");
		break;
		default: break;
		case 3://awaken
		break;
	}
	
	with obj_character
	{
		scr_init_hero();
	}
}

// set text - this is moved outside the click logic to ensure it gets set after the initial character load
switch(type)
{
	case 0://weapon
		text=global.player_weapon.name;
	break;
	case 1://armor
		text=global.player_armor.name;
	break;
	case 2://helm
		text=global.player_helm.name;
	break;
	default: break;
	case 3://awaken
	break;
}