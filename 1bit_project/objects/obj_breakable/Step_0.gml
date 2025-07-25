if hp<=0 {state=states.death;}
if random_frame==false {image_index=(1-(hp/hp_max))*(image_number-1);}
var _sound=snd_null;
var _mix=1;
var _submix=1;

switch state
{
	case states.idle:
		x=x_orig;
		y=y_orig;
	break;
	case states.hit:
		var screenshake=instance_create(obj_fx_screenshake);
		screenshake.shake=shake_power;
		timer=0;
		state=states.block;
		invincible=true;
		
		//SOUND
		_submix=.2;
		switch material{
			case "generic":
			_sound=choose(snd_breakable_generic_1,snd_breakable_generic_2,snd_breakable_generic_3);
			_mix=_submix*1;
			break;
			case "ceramic":
			_sound=choose(snd_wpn_arm_ceramic_01,snd_wpn_arm_ceramic_02,snd_wpn_arm_ceramic_03,snd_wpn_arm_ceramic_04,snd_wpn_arm_ceramic_05,snd_wpn_arm_ceramic_06,snd_wpn_arm_ceramic_07,snd_wpn_arm_ceramic_08,snd_wpn_arm_ceramic_09,snd_wpn_arm_ceramic_10,snd_wpn_arm_ceramic_11);
			_mix=_submix*1;
			break;
			case "stone":
			_sound=choose(snd_breakable_generic_1,snd_breakable_generic_2,snd_breakable_generic_3);
			_mix=_submix*1;
			break;
			case "wood":
			_sound=choose(snd_breakable_wood_1,snd_breakable_wood_2,snd_breakable_wood_3,snd_breakable_wood_4,snd_breakable_wood_5,snd_breakable_wood_6,snd_breakable_wood_7);
			_mix=_submix*1;
			break;
			case "bush":
			_sound = choose(snd_breakable_bushes_hit_1, snd_breakable_bushes_hit_2, snd_breakable_bushes_hit_3, snd_breakable_bushes_hit_4, snd_breakable_bushes_hit_5, snd_breakable_bushes_hit_6);
			_mix=_submix*1;
			break;
			default:
			_sound=snd_error;
			_mix=_submix*2;
			break;
		}
		scr_audio_play(_sound,_mix,clamp(2-hp_max/2,0.5,2));
	break;
	case states.block:
		timer+=1;
		x=x_orig+(random_range(shake_power+shake_power_hit,-shake_power-shake_power_hit)*shake_power_multiplier);
		y=y_orig+(random_range(shake_power+shake_power_hit,-shake_power-shake_power_hit)*shake_power_multiplier);
		if timer>shake_time
		{
			state=states.idle;
			invincible=false;
		}
	break;
	case states.death:
		var screenshaker=instance_create(obj_fx_screenshake);
		screenshaker.shake=shake_power*2;
		repeat(irandom_range(debris_min,debris_max))
		{instance_create_depth(x+(random_range(-debris_max,debris_max)),y-(random_range(0,debris_max)),-y,debris_type);}
		
		//SOUND
		_submix=clamp(.25+(hp_max/5),0.25,.6);
		switch material{
			case "generic":
			_sound=choose(snd_breakable_generic_4,snd_breakable_generic_5,snd_breakable_generic_6,snd_breakable_generic_7);
			_mix=_submix*1;
			break;
			case "ceramic":
			_sound=choose(snd_breakable_ceramic_1,snd_breakable_ceramic_2,snd_breakable_ceramic_3,snd_breakable_ceramic_4,snd_breakable_ceramic_5,snd_breakable_ceramic_6,snd_breakable_ceramic_7,snd_breakable_ceramic_8,snd_breakable_ceramic_9);
			_mix=_submix*1;
			break;
			case "stone":
			_sound=choose(snd_breakable_stone_1,snd_breakable_stone_2,snd_breakable_stone_3,snd_breakable_stone_4,snd_breakable_stone_5);
			_mix=_submix*1;
			break;
			case "wood":
			_sound=choose(snd_breakable_generic_1,snd_breakable_generic_2,snd_breakable_generic_3);
			_mix=_submix*1;
			break;
			case "bush":
			_sound = choose(snd_breakable_bushes_1, snd_breakable_bushes_2, snd_breakable_bushes_3, snd_breakable_bushes_4, snd_breakable_bushes_5, snd_breakable_bushes_6, snd_breakable_bushes_7, snd_breakable_bushes_8, snd_breakable_bushes_9);
			_mix=_submix*1;
			break;
			default:
			_sound=snd_error;
			_mix=_submix*2;
			break;
		}
		scr_audio_play(_sound,_mix,clamp(2-hp_max/2,0.5,2)+random_range(-.1,.1));
		
		instance_destroy();
		
		// re-create the pathfinding grid since this instance will no longer be in it
		init_pathfinding_grid();
	break;
}