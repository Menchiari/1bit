/// @description 

// Inherit the parent event
idle_speed=random_range(0,.1);
event_inherited();
if !instance_exists(obj_enemy) {speech_text="good luck"}
else
{
	if mouse_check_button_released(mb_any)
	{
		if collision_circle(mouse_x,mouse_y,10,self,true,false) && speech_visible==true
		{
			sentence+=1;
		}
	}
	switch sentence
	{
		case 0:
		speech_text="kill the guard\nto steal his key";
		break;
		case 1:
		speech_text="you might be\nable to escape";
		break;
		case 2:
		speech_text="not me: he threw\nmy key away";
		break;
		case 3:
		speech_text="";
		break;
		default:
		sentence=0;
		break;
	}
}
