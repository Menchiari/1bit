event_inherited();
if mouse_check_button_released(mb_any)
{
	if collision_point(mouse_x,mouse_y,self,true,false)
	{
		scr_loadgame();
		room_goto(start_room);
	}
}