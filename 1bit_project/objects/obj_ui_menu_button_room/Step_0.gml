event_inherited();
if mouse_check_button_released(mb_any)
{
	scr_audio_play(snd_click);
	if collision_point(mouse_x,mouse_y,self,true,false)
	{
		alarm[5]=5;
	}
}