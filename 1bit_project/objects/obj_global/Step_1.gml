/// @description gamepad input
scr_input_update();
//Exit gamepad
if (gamepad_button_check_pressed(0, gp_select))
{
	game_end();
}