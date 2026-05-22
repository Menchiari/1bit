/// @description 
if mouse_check_button_released(mb_any) && collision_point(global.cursor_x, global.cursor_y, self, true, false)
{
	room_goto(rm_menu_deletesave);
}