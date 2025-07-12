/// @description 
if mouse_check_button_released(mb_any) && collision_point(mouse_x,mouse_y,self,true,false)
{
	room_goto(rm_menu_deletesave);
}