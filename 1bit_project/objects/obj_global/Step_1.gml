/// @description gamepad input
scr_input_update();
//Exit gamepad
if (global.gamepad_slot >= 0 && gamepad_button_check_pressed(global.gamepad_slot, gp_select))
{
	game_end();
}