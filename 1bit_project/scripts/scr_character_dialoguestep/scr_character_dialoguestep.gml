// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_character_dialoguestep(){
	var _range=17;
	var _yoffset=-12;
	if collision_circle(x,y+_yoffset,speech_distance_enemy,obj_enemy,false,true) && speech_without_enemies==true {speech_text=speech_text_enemy}
	else
	{
		if mouse_check_button_released(mb_any)
		{
			if collision_circle(mouse_x,mouse_y,_range,self,true,false) && speech_visible==true
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