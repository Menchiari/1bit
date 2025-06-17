/// @description 

// Inherit the parent event
event_inherited();

if !instance_exists(obj_door_metal) {speech_text="GOOD LUCK"}
else
{
	if mouse_check_button_released(mb_any)
	{
		if collision_circle(mouse_x,mouse_y,20,self,true,false) && speech_visible==true
		{
			sentence+=1;
		}
	}
	switch sentence
	{
		case 0:
		speech_text=speech_text_1;
		break;
		case 1:
		speech_text=speech_text_2;
		break;
		case 2:
		speech_text=speech_text_3;
		break;
		case 3:
		speech_text=speech_text_4;
		break;
		case 4:
		speech_text=speech_text_5;
		break;
		default:
		sentence=0;
		break;
	}
}
