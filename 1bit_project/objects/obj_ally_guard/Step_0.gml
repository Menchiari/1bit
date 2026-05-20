/// @description 

// Inherit the parent event
idle_speed=random_range(0,.1);
event_inherited();
if !instance_exists(obj_enemy) {speech_text="good luck"}
else
{
	if mouse_check_button_released(mb_any)
	{
		if point_in_circle(mouse_x,mouse_y,x,y-16,20)//collision_circle(mouse_x,mouse_y,10,self,true,false)
		&& speech_visible==true
		{
			sentence+=1;
		}
	}
	
	// gamepad
	if (global.action_released && global.using_gamepad
	&& speech_visible==true && instance_exists(obj_hero)
	&& point_distance(obj_hero.x, obj_hero.y, x, y-16) < 20)
	{
		sentence+=1;
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
