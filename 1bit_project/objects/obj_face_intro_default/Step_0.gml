/// @description
var length = string_width(txt);
	timer+=1;
    switch state
	{
		case "talk":
			image_speed=image_speed_default;
			if timer>=length*txt_speed
			{
				if txt_auto==true
				{
					image_index=0;
					txt_phase+=1;
					timer=0;
				}
				else
				{
					state="idle";
					timer=0;
				}
			}
			if mouse_check_button_released(mb_any)
			{
				state="idle";
				timer=0;
			}
		break;
		case "idle":
			image_speed = 0;
			blink_hold = (blink_hold > 0) ? blink_hold - 1 : (irandom_range(0, 30) == 0 ? 5 : 0); //holds for 5 frames
			image_index = (blink_hold > 0);
		
			if mouse_check_button_released(mb_any)
			|| timer>=idle_time
			{
				txt_phase+=1;
				state="talk";
				timer=0;
			}
		break;
		case "wait":
			image_speed = 0;
			blink_hold = (blink_hold > 0) ? blink_hold - 1 : (irandom_range(0, 50) == 0 ? 5 : 0); //holds for 5 frames
			image_index = (blink_hold > 0);
		
			if mouse_check_button_released(mb_any)
			|| timer>=wait_time
			{
				txt_phase+=1;
				state="talk";
				timer=0;
			}
		break;
		default: break;
	}

	switch txt_phase
	{
		case 0:
			txt="";
		break;
		case 1:
			txt="Welcome Traveler";
		break;
		case 2:
			//waits briefly
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*.75;
		break;
		case 3:
			txt="Today is the day you DIE";
			sprite_index=spr_faces_intro_mock;
		break;
		case 4:
			//laughs shortly
			sprite_index=spr_faces_intro_default;
			txt="         ";
		break;
		case 5:
			sprite_index=spr_faces_intro_default;
			txt="and if you won't,\nkeep coming back";
			txt_auto=true;
		break;
		case 6:
			txt="I'll have a surprise for you";
		break;
		case 7:
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*1;
		break;
		case 8:
			instance_create(obj_fx_fadeout);
			alarm[0]=game_get_speed(gamespeed_fps)*2
		break;
		default: break;
	}
