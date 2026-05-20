event_inherited();
if mouse_check_button_released(mb_any)
{
	if collision_point(mouse_x,mouse_y,self,true,false)
	{
		alarm[5]=5;
	}
}
// gamepad: A triggers AWAKEN only when cursor is on it, Start always works
if (global.using_gamepad)
{
	var _on_awaken = !instance_exists(obj_ui_menu_character) || !variable_instance_exists(obj_ui_menu_character, "menu_cursor") || obj_ui_menu_character.menu_cursor == 0;
	if ((global.action_released && _on_awaken) || gamepad_button_check_released(0, gp_start))
	{
		alarm[5]=5;
	}
}