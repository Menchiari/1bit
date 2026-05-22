/// @description 
if mouse_check_button_released(mb_any) && collision_point(global.cursor_x, global.cursor_y, self, true, false)
{
	room_goto(rm_menu_character);
}

// ---- gamepad navigation for delete save screen ----
if (global.using_gamepad)
{
	// init cursor: 0 = BACK (left), 1 = RESET SAVE (right)
	// reset to BACK each room entry (button is non-persistent, so _ds_inited resets)
	if (!variable_instance_exists(id, "_ds_inited"))
	{
		_ds_inited = true;
		global.deletesave_cursor = 0;
	}

	// right stick edge detection
	if (!variable_instance_exists(id, "_rs_ph")) _rs_ph = 0;
	var _rh = gamepad_axis_value(0, gp_axisrh);
	var _rs_left  = (_rh < -0.5 && _rs_ph >= -0.5);
	var _rs_right = (_rh >  0.5 && _rs_ph <=  0.5);
	_rs_ph = _rh;

	// left stick edge detection
	if (!variable_instance_exists(id, "_ls_ph")) _ls_ph = 0;
	var _lh = gamepad_axis_value(0, gp_axislh);
	var _ls_left  = (_lh < -0.5 && _ls_ph >= -0.5);
	var _ls_right = (_lh >  0.5 && _ls_ph <=  0.5);
	_ls_ph = _lh;

	// left/right toggles between BACK and RESET
	if (gamepad_button_check_pressed(0, gp_padl) || keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || _rs_left || _ls_left)
		global.deletesave_cursor = 0;
	if (gamepad_button_check_pressed(0, gp_padr) || keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || _rs_right || _ls_right)
		global.deletesave_cursor = 1;

	// A-button activates the selected button
	if (global.action_released)
	{
		if (global.deletesave_cursor == 0)
		{
			room_goto(rm_menu_character);
		}
		else if (global.deletesave_cursor == 1 && instance_exists(obj_ui_menu_button_reset))
		{
			with (obj_ui_menu_button_reset) { nextclick = true; }
		}
	}

	// B-button always goes back
	if (gamepad_button_check_released(0, gp_face2))
	{
		room_goto(rm_menu_character);
	}
}