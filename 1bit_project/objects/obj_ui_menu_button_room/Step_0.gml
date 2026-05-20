event_inherited();
if mouse_check_button_released(mb_any)
{
	if collision_point(mouse_x,mouse_y,self,true,false)
	{
		alarm[5]=5;
	}
}
// gamepad: A or Start triggers AWAKEN
if (global.using_gamepad && (global.action_released || gamepad_button_check_released(0, gp_start)))
{
	alarm[5]=5;
}