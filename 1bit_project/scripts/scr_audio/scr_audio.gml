// WEAPON SWING
function scr_audio_weapon_swing(_frame,_power){
	if image_index==_frame
	{
		var _sound=snd_null;
		var _mix=.75;
		show_debug_message(string(weapon.weapon_animset)+" swing");
		_sound = choose(snd_wpn_woosh_01, snd_wpn_woosh_02, snd_wpn_woosh_03, snd_wpn_woosh_04, snd_wpn_woosh_05, snd_wpn_woosh_06, snd_wpn_woosh_07, snd_wpn_woosh_08, snd_wpn_woosh_09);
		switch weapon.weapon_animset
		{
			case weapons_animset.hands:
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
			break;
			default:
			break;
		}
		if object_index==obj_dog || object_index==obj_enemy_dog || object_index==obj_enemy_boar {_sound=snd_null;}
		audio_play_sound_at(_sound,x,y,0,25,350,1,false,9,_power*global.audio_weapons*_mix,0,random_range(-.1,.1)+clamp(1/(weapon.weight/10),.4,1.8));
	}
}

// WEAPON HIT
function scr_audio_weapon_hit(_frame,_power){
	if image_index==_frame
	{
		var _sound=snd_null;
		var _mix=1;
		show_debug_message(string(weapon.weapon_animset)+" hit");
		switch weapon.weapon_animset
		{
			case weapons_animset.hands:
			_sound = choose(snd_wpn_punch_01, snd_wpn_punch_02, snd_wpn_punch_03, snd_wpn_punch_04, snd_wpn_punch_05, snd_wpn_punch_06, snd_wpn_punch_07, snd_wpn_punch_08);
			_mix=2;

			break;
			case weapons_animset.dagger:
			_sound = choose(snd_wpn_knife_01, snd_wpn_knife_02, snd_wpn_knife_03, snd_wpn_knife_04, snd_wpn_knife_05, snd_wpn_knife_06, snd_wpn_knife_07, snd_wpn_knife_08, snd_wpn_knife_09, snd_wpn_knife_10);

			break;
			case weapons_animset.stick:
			_sound = choose(snd_wpn_stick_01, snd_wpn_stick_02, snd_wpn_stick_03, snd_wpn_stick_04, snd_wpn_stick_05, snd_wpn_stick_06, snd_wpn_stick_07, snd_wpn_stick_08, snd_wpn_stick_09, snd_wpn_stick_10, snd_wpn_stick_11);

			break;
			case weapons_animset.sword:
			_sound = choose(snd_wpn_sword_01, snd_wpn_sword_02, snd_wpn_sword_03, snd_wpn_sword_04, snd_wpn_sword_05, snd_wpn_sword_06, snd_wpn_sword_07, snd_wpn_sword_08, snd_wpn_sword_09, snd_wpn_sword_10, snd_wpn_sword_11, snd_wpn_sword_12, snd_wpn_sword_13);

			break;
			case weapons_animset.katana:
			_sound = choose(snd_wpn_sword_01, snd_wpn_sword_02, snd_wpn_sword_03, snd_wpn_sword_04, snd_wpn_sword_05, snd_wpn_sword_06, snd_wpn_sword_07, snd_wpn_sword_08, snd_wpn_sword_09, snd_wpn_sword_10, snd_wpn_sword_11, snd_wpn_sword_12, snd_wpn_sword_13);

			break;
			case weapons_animset.shotgun:
			_sound = choose(snd_wpn_shotgun_01, snd_wpn_shotgun_02, snd_wpn_shotgun_03, snd_wpn_shotgun_04, snd_wpn_shotgun_05, snd_wpn_shotgun_06, snd_wpn_shotgun_07);

			break;
			case weapons_animset.null:
			_sound = choose(snd_wpn_punch_01, snd_wpn_punch_02, snd_wpn_punch_03, snd_wpn_punch_04, snd_wpn_punch_05, snd_wpn_punch_06, snd_wpn_punch_07, snd_wpn_punch_08);
			_mix=2;
			if object_index==obj_dog || object_index==obj_enemy_dog{
			_sound = choose(snd_wpn_dog_01, snd_wpn_dog_02, snd_wpn_dog_03, snd_wpn_dog_04, snd_wpn_dog_05, snd_wpn_dog_06, snd_wpn_dog_07, snd_wpn_dog_08, snd_wpn_dog_09, snd_wpn_dog_10);
			_mix=1.3;
			}
			if object_index==obj_enemy_boar {
			_sound = choose(snd_wpn_boar_1, snd_wpn_boar_2, snd_wpn_boar_3, snd_wpn_boar_4, snd_wpn_boar_5, snd_wpn_boar_6);
			_mix=1.6;
			}
			if object_index==obj_enemy_zombie {
			_sound = choose(snd_wpn_zombie_01, snd_wpn_zombie_02, snd_wpn_zombie_03, snd_wpn_zombie_04, snd_wpn_zombie_05, snd_wpn_zombie_06, snd_wpn_zombie_07, snd_wpn_zombie_08, snd_wpn_zombie_09, snd_wpn_zombie_10);
			_mix=1.5;
			}

			break;
			default:
			break;
		}
		audio_play_sound_at(_sound,x,y,0,25,350,1,false,9,_power*global.audio_weapons*_mix,0,random_range(-.1,.1)+clamp(1/(weapon.weight/10),.4,1.8));
	}
}

// WEAPON EQUIP
function scr_audio_weapon_equip(_frame,_power){
	if image_index==_frame
	{
		var _sound=snd_null;
		var _mix=1;
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
		audio_play_sound_at(_sound,x,y,0,200,350,1,false,9,_power*global.audio_ui*_mix,0,random_range(.8,1.2));
	}
}

// BLOCK HIT
function scr_audio_armor_hit(_frame,_power){
	if image_index==_frame
	{
		var _sound=snd_error;
		var _mix=1;
		var _pitch=1;
		show_debug_message("armor "+string(self.armor.material)+" hit");
		switch armor.material
		{
			case armors_material.flesh:
			_sound = choose(snd_wpn_arm_flesh_1, snd_wpn_arm_flesh_2, snd_wpn_arm_flesh_3, snd_wpn_arm_flesh_4, snd_wpn_arm_flesh_5, snd_wpn_arm_flesh_6, snd_wpn_arm_flesh_7, snd_wpn_arm_flesh_8);
			_pitch = 0.5;

			break;
			case armors_material.cloth:
			_sound = choose(snd_wpn_arm_cloth_01, snd_wpn_arm_cloth_02, snd_wpn_arm_cloth_03, snd_wpn_arm_cloth_04, snd_wpn_arm_cloth_05, snd_wpn_arm_cloth_06, snd_wpn_arm_cloth_07, snd_wpn_arm_cloth_08, snd_wpn_arm_cloth_09, snd_wpn_arm_cloth_10);

			break;
			case armors_material.leather:
			_sound = choose(snd_wpn_arm_leather_01, snd_wpn_arm_leather_02, snd_wpn_arm_leather_03, snd_wpn_arm_leather_04, snd_wpn_arm_leather_05, snd_wpn_arm_leather_06, snd_wpn_arm_leather_07, snd_wpn_arm_leather_08, snd_wpn_arm_leather_09, snd_wpn_arm_leather_10, snd_wpn_arm_leather_11, snd_wpn_arm_leather_12, snd_wpn_arm_leather_13, snd_wpn_arm_leather_14, snd_wpn_arm_leather_15, snd_wpn_arm_leather_16, snd_wpn_arm_leather_17, snd_wpn_arm_leather_18);

			break;
			case armors_material.cape:
			_sound = choose(snd_wpn_arm_cloth_01, snd_wpn_arm_cloth_02, snd_wpn_arm_cloth_03, snd_wpn_arm_cloth_04, snd_wpn_arm_cloth_05, snd_wpn_arm_cloth_06, snd_wpn_arm_cloth_07, snd_wpn_arm_cloth_08, snd_wpn_arm_cloth_09, snd_wpn_arm_cloth_10);

			break;
			case armors_material.ceramic:
			_sound = choose(snd_wpn_arm_ceramic_01, snd_wpn_arm_ceramic_02, snd_wpn_arm_ceramic_03, snd_wpn_arm_ceramic_04, snd_wpn_arm_ceramic_05, snd_wpn_arm_ceramic_06, snd_wpn_arm_ceramic_07, snd_wpn_arm_ceramic_08, snd_wpn_arm_ceramic_09, snd_wpn_arm_ceramic_10, snd_wpn_arm_ceramic_11, snd_wpn_arm_ceramic_12);

			break;
			case armors_material.chainmail:
			_sound = choose(snd_wpn_arm_chainmail_1, snd_wpn_arm_chainmail_2, snd_wpn_arm_chainmail_3, snd_wpn_arm_chainmail_4, snd_wpn_arm_chainmail_5, snd_wpn_arm_chainmail_6, snd_wpn_arm_chainmail_7);

			break;
			case armors_material.metal_thin:
			_sound = choose(snd_wpn_arm_metal_thin_01, snd_wpn_arm_metal_thin_02, snd_wpn_arm_metal_thin_03, snd_wpn_arm_metal_thin_04, snd_wpn_arm_metal_thin_05, snd_wpn_arm_metal_thin_06, snd_wpn_arm_metal_thin_07, snd_wpn_arm_metal_thin_08, snd_wpn_arm_metal_thin_09, snd_wpn_arm_metal_thin_10, snd_wpn_arm_metal_thin_11, snd_wpn_arm_metal_thin_12);

			break;
			case armors_material.metal_thick:
			_sound = choose(snd_wpn_arm_metal_thick_1, snd_wpn_arm_metal_thick_2, snd_wpn_arm_metal_thick_3, snd_wpn_arm_metal_thick_4, snd_wpn_arm_metal_thick_5, snd_wpn_arm_metal_thick_6, snd_wpn_arm_metal_thick_7, snd_wpn_arm_metal_thick_8);

			break;
			case armors_material.wood:
			_sound = choose(snd_wpn_arm_wood_01, snd_wpn_arm_wood_02, snd_wpn_arm_wood_03, snd_wpn_arm_wood_04, snd_wpn_arm_wood_05, snd_wpn_arm_wood_06, snd_wpn_arm_wood_07, snd_wpn_arm_wood_08, snd_wpn_arm_wood_09, snd_wpn_arm_wood_10, snd_wpn_arm_wood_11, snd_wpn_arm_wood_12);

			break;
			default:
			_sound = snd_null;
			
			break;
		}
		audio_play_sound_at(_sound,x,y,0,25,350,1,false,2,_power*global.audio_weapons*_mix,0,random_range(-.1,.1)+clamp(1/(armor.weight/10),.6,1.4)*_pitch);
	}
}

// CRITICAL HIT
function scr_audio_critical(_frame,_power){
	if image_index==_frame
	{
		var _sound = choose(snd_wpn_critical_01, snd_wpn_critical_02, snd_wpn_critical_03, snd_wpn_critical_04, snd_wpn_critical_05, snd_wpn_critical_06, snd_wpn_critical_07);
		var _mix=1;
		show_debug_message("critical hit");
		audio_play_sound_at(_sound,x,y,0,50,350,1,false,9,_power*global.audio_hits*_mix,0,random_range(.8,1.2));
	}
}

// DEATH HIT
function scr_audio_death(_frame,_power){
	if image_index==_frame
	{
		var _sound = choose(snd_wpn_kill_01, snd_wpn_kill_02, snd_wpn_kill_03, snd_wpn_kill_04, snd_wpn_kill_05, snd_wpn_kill_06, snd_wpn_kill_07, snd_wpn_kill_08);
		var _mix=1;
		show_debug_message(string(self.name)+" dies");
		audio_play_sound_at(_sound,x,y,0,50,350,1,false,9,_power*global.audio_hits*_mix,0,random_range(.8,1.2));
	}
}

// HURT
function scr_audio_hurt(_frame,_power){
	if image_index==_frame
	{
		var _sound = choose(snd_wpn_hurt_01, snd_wpn_hurt_02, snd_wpn_hurt_03, snd_wpn_hurt_04, snd_wpn_hurt_05, snd_wpn_hurt_06, snd_wpn_hurt_07, snd_wpn_hurt_08, snd_wpn_hurt_09, snd_wpn_hurt_10, snd_wpn_hurt_11, snd_wpn_hurt_12, snd_wpn_hurt_13, snd_wpn_hurt_14, snd_wpn_hurt_15, snd_wpn_hurt_16, snd_wpn_hurt_17, snd_wpn_hurt_18);
		var _mix=1;
		if object_index==obj_dog {
		_sound=snd_wpn_dog_hurt_1;
		_mix=1.8;
		}
		if object_index==obj_enemy_boar {
		_sound = choose(snd_wpn_boar_hurt_1, snd_wpn_boar_hurt_2, snd_wpn_boar_hurt_3, snd_wpn_boar_hurt_4, snd_wpn_boar_hurt_5, snd_wpn_boar_hurt_6, snd_wpn_boar_hurt_7);
		_mix=1.7;
		}
		if object_index==obj_enemy_zombie{
		_sound = choose(snd_wpn_zombie_01, snd_wpn_zombie_02, snd_wpn_zombie_03, snd_wpn_zombie_04, snd_wpn_zombie_05, snd_wpn_zombie_06, snd_wpn_zombie_07, snd_wpn_zombie_08, snd_wpn_zombie_09, snd_wpn_zombie_10);
		_mix=1.5;
		}

		show_debug_message(string(self.name)+" hurt");
		audio_play_sound_at(_sound,x,y,0,30,350,1,false,9,_power*global.audio_voices*_mix,0,random_range(.8,1.2));
	}
}

// YELLS
function scr_audio_yell(_frame,_power){
	if image_index==_frame
	{
		var _sound = choose(snd_wpn_yell_01, snd_wpn_yell_02, snd_wpn_yell_03, snd_wpn_yell_04, snd_wpn_yell_05, snd_wpn_yell_06, snd_wpn_yell_07, snd_wpn_yell_08, snd_wpn_yell_09, snd_wpn_yell_10);
		var _mix=1;
		show_debug_message(string(self.name)+" screams");
		audio_play_sound_at(_sound,x,y,0,30,350,1,false,9,_power*global.audio_voices*_mix,0,random_range(.8,1.2));
	}
}

// ROLLING
function scr_audio_roll(_frame,_power){
	var _sound = choose(snd_fall_asf_1,snd_fall_asf_2,snd_fall_asf_3,snd_fall_asf_4,snd_fall_asf_5,snd_fall_asf_6,snd_fall_asf_7);
	var _mix=1;
	if round(image_index)==_frame && !audio_is_playing(_sound)
	{
		show_debug_message(string(self.name)+" screams");
		audio_play_sound_at(_sound,x,y,0,25,300,1,false,9,_power*global.audio_footsteps*_mix,0,random_range(-.1,.1)+clamp(1/(weapon.weight/10),.4,1.8));
	}
}

// ANY SOUND
function scr_audio_play(_sound=snd_null,_volume=0.2,_pitch=1,_loop=false,_radius=60,_range=250){
	return audio_play_sound_at(_sound,x,y,0,_radius,_range,1,_loop,10,_volume,0,_pitch);
}