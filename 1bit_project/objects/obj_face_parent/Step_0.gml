/// @description
timer+=1;
var length = string_width(txt);
if (txt_progress < string_length(txt)) {txt_progress += txt_progress_spd;}//makes the text appear progressively

/////////////////////////STATES//////////////////////////
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
				txt_progress=0;
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
			txt_progress=string_length(txt);
		}
	break;
	case "talk_intense":
		image_speed=image_speed_default;
		idle_time=game_get_speed(gamespeed_fps)*1;
		if image_index>=image_number-1 {image_index=image_number-1;}
		if timer>=length*txt_speed
		{
			if txt_auto==true
			{
				image_index=0;
				txt_phase+=1;
				timer=0;
				txt_progress=0;
			}
			else
			{
				image_index=0;
				state="idle";
				timer=0;
			}
		}
		if mouse_check_button_released(mb_any)
		{
			state="idle";
			timer=0;
			txt_progress=string_length(txt);
		}
	break;
	case "idle":
		image_speed = 0;
		idle_time=idle_time_default;
		blink_hold = (blink_hold > 0) ? blink_hold - 1 : (irandom_range(0, 30) == 0 ? 5 : 0); //holds for 5 frames
		image_index = (blink_hold > 0);
		
		if mouse_check_button_released(mb_any)
		|| timer>=idle_time
		{
			txt_phase+=1;
			state="talk";
			timer=0;
			txt_progress=0;
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
			txt_progress=0;
		}
	break;
	default: break;
}

