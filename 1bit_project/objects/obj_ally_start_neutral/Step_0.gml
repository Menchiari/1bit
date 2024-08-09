/// @description 

// Inherit the parent event
idle_speed=random_range(0,.1);
event_inherited();
if instance_exists(obj_camera)
{
	if collision_rectangle(obj_camera.x-global.res_x/2,obj_camera.y-global.res_y/2,obj_camera.x+global.res_x/2,obj_camera.y+global.res_y/2,obj_enemy,true,true) && speech_without_enemies==true {speech_text=speech_text_enemy}
	else
	{
		if mouse_check_button_released(mb_any)
		{
			if collision_circle(mouse_x,mouse_y,10,self,true,false) && speech_visible==true
			{
				if sentence <= max_sentences-1 {sentence+=1;}
				else {sentence=0}
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
			case 5:
			speech_text=speech_text_6;
			break;
			case 6:
			speech_text=speech_text_7;
			break;
			case 7:
			speech_text=speech_text_8;
			break;
			default:
			sentence=0;
			break;
		}
	}
}
