// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_audio_weapon_swing(_frame,_power){
	if image_index==_frame
	{
		var _sound=snd_footstep_run_asf_1;
		switch weapon.weapon_animset
		{
			case weapons_animset.hands:
				show_debug_message("hands swing");
				weapon_sound=snd_fall_asf_1;
			break;
			case weapons_animset.dagger:
				show_debug_message("dagger swing");
			break;
			case weapons_animset.stick:
				show_debug_message("stick swing");
			break;
			case weapons_animset.sword:
				show_debug_message("sword swing");
			break;
			case weapons_animset.katana:
				show_debug_message("katana swing");
			break;
			case weapons_animset.shotgun:
				show_debug_message("shotgun swing");
			break;
			case weapons_animset.null:
				show_debug_message("null swing");
				weapon_sound=snd_fall_asf_1;
			break;
			default:
			break;
		}
		audio_play_sound_at(_sound,x,y,y,50,150,1,false,9,_power/20,0,random_range(.8,1.2));
	}
}
function scr_audio_weapon_hit(_frame,_power){
	if image_index==_frame
	{
		var _sound=snd_footstep_run_asf_1;
		switch weapon.weapon_animset
		{
			case weapons_animset.hands:
				show_debug_message("hands swing");
				weapon_sound=snd_fall_asf_1;
			break;
			case weapons_animset.dagger:
				show_debug_message("dagger swing");
			break;
			case weapons_animset.stick:
				show_debug_message("stick swing");
			break;
			case weapons_animset.sword:
				show_debug_message("sword swing");
			break;
			case weapons_animset.katana:
				show_debug_message("katana swing");
			break;
			case weapons_animset.shotgun:
				show_debug_message("shotgun swing");
			break;
			case weapons_animset.null:
				show_debug_message("null swing");
				weapon_sound=snd_fall_asf_1;
			break;
			default:
			break;
		}
		audio_play_sound_at(_sound,x,y,y,50,150,1,false,9,_power/20,0,random_range(.8,1.2));
	}
}
function scr_audio_weapon_equip(_frame,_power){
	if image_index==_frame
	{
		var _sound=snd_footstep_run_asf_1;
		switch weapon.weapon_animset
		{
			case weapons_animset.hands:
				show_debug_message("hands swing");
				weapon_sound=snd_fall_asf_1;
			break;
			case weapons_animset.dagger:
				show_debug_message("dagger swing");
			break;
			case weapons_animset.stick:
				show_debug_message("stick swing");
			break;
			case weapons_animset.sword:
				show_debug_message("sword swing");
			break;
			case weapons_animset.katana:
				show_debug_message("katana swing");
			break;
			case weapons_animset.shotgun:
				show_debug_message("shotgun swing");
			break;
			case weapons_animset.null:
				show_debug_message("null swing");
				weapon_sound=snd_fall_asf_1;
			break;
			default:
			break;
		}
		audio_play_sound_at(_sound,x,y,y,50,150,1,false,9,_power/20,0,random_range(.8,1.2));
	}
}
function scr_audio_weapon_block(_frame,_power){
	if image_index==_frame
	{
		var _sound=snd_footstep_run_asf_1;
		//switch armor.material
		audio_play_sound_at(_sound,x,y,y,50,150,1,false,9,_power/20,0,random_range(.8,1.2));
	}
}
