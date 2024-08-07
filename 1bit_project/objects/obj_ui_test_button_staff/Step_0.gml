/// @description 
if mouse_check_button_released(mb_any)
{
	if collision_point(mouse_x,mouse_y,self,true,false)
	{
		global.player_weapon=weapons.stick;
		room_goto(rm_start);
	}
}
