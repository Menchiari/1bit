// WEAPON SWING
function scr_audio_weapon_swing(_frame,_power){
	if image_index==_frame
	{
		var _sound=snd_footstep_run_asf_1;
		show_debug_message(string(weapon.weapon_animset)+" swing");
		switch weapon.weapon_animset
		{
			case weapons_animset.hands:
				weapon_sound=snd_fall_asf_1;
			break;
			case weapons_animset.dagger:
			break;
			case weapons_animset.stick:
			break;
			case weapons_animset.sword:
			break;
			case weapons_animset.katana:
			break;
			case weapons_animset.shotgun:
			break;
			case weapons_animset.null:
				weapon_sound=snd_fall_asf_1;
			break;
			default:
			break;
		}
		audio_play_sound_at(_sound,x,y,y,50,150,1,false,9,_power*global.audio_weapons,0,random_range(.8,1.2));
	}
}

// WEAPON HIT
function scr_audio_weapon_hit(_frame,_power){
	if image_index==_frame
	{
		var _sound=snd_footstep_run_asf_1;
		show_debug_message(string(weapon.weapon_animset)+" hit");
		switch weapon.weapon_animset
		{
			case weapons_animset.hands:
				weapon_sound=snd_fall_asf_1;
			break;
			case weapons_animset.dagger:
			break;
			case weapons_animset.stick:
			break;
			case weapons_animset.sword:
			break;
			case weapons_animset.katana:
			break;
			case weapons_animset.shotgun:
			break;
			case weapons_animset.null:
				weapon_sound=snd_fall_asf_1;
			break;
			default:
			break;
		}
		audio_play_sound_at(_sound,x,y,y,50,150,1,false,9,_power*global.audio_weapons,0,random_range(.8,1.2));
	}
}

// WEAPON EQUIP
function scr_audio_weapon_equip(_frame,_power){
	if image_index==_frame
	{
		var _sound=snd_footstep_run_asf_1;
		show_debug_message(string(weapon.weapon_animset)+" equip");
		switch weapon.weapon_animset
		{
			case weapons_animset.hands:
				weapon_sound=snd_fall_asf_1;
			break;
			case weapons_animset.dagger:
			break;
			case weapons_animset.stick:
			break;
			case weapons_animset.sword:
			break;
			case weapons_animset.katana:
			break;
			case weapons_animset.shotgun:
			break;
			case weapons_animset.null:
				weapon_sound=snd_fall_asf_1;
			break;
			default:
			break;
		}
		audio_play_sound_at(_sound,x,y,y,50,150,1,false,9,_power*global.audio_weapons,0,random_range(.8,1.2));
	}
}

// ARMOR HIT
function scr_audio_weapon_block(_frame,_power){
	if image_index==_frame
	{
		var _sound=snd_footstep_run_asf_1;
		show_debug_message("armor "+string(armor.material)+" hit");
		switch armor.material
		{
			case armors_material.flesh:
			break;
			case armors_material.cloth:
			break;
			case armors_material.leather:
			break;
			case armors_material.cape:
			break;
			case armors_material.ceramic:
			break;
			case armors_material.chainmail:
			break;
			case armors_material.metal_thin:
			break;
			case armors_material.metal_thick:
			break;
			case armors_material.wood:
			break;
			default:
			break;
		}
		audio_play_sound_at(_sound,x,y,y,50,150,1,false,9,_power*global.audio_weapons,0,random_range(.8,1.2));
	}
}

// CRITICAL HIT
function scr_audio_critical(_frame,_power){
	if image_index==_frame
	{
		var _sound=snd_footstep_run_asf_1;
		show_debug_message("critical hit");
		audio_play_sound_at(_sound,x,y,y,50,150,1,false,9,_power*global.audio_hits,0,random_range(.8,1.2));
	}
}

// DEATH HIT
function scr_audio_death(_frame,_power){
	if image_index==_frame
	{
		var _sound=snd_footstep_run_asf_1;
		show_debug_message(string(self.name)+" dies");
		audio_play_sound_at(_sound,x,y,y,50,150,1,false,9,_power*global.audio_hits,0,random_range(.8,1.2));
	}
}


function scr_audio_hurt(_frame,_power){
	if image_index==_frame
	{
		var _sound=snd_footstep_run_asf_1;
		show_debug_message(string(self.name)+" hurt");
		audio_play_sound_at(_sound,x,y,y,50,150,1,false,9,_power*global.audio_voices,0,random_range(.8,1.2));
	}
}

function scr_audio_yell(_frame,_power){
	if image_index==_frame
	{
		var _sound=snd_footstep_run_asf_1;
		show_debug_message(string(self.name)+" screams");
		audio_play_sound_at(_sound,x,y,y,50,150,1,false,9,_power*global.audio_voices,0,random_range(.8,1.2));
	}
}