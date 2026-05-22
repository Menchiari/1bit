/// @description 
if mouse_check_button(mb_any) && collision_point(global.cursor_x, global.cursor_y, self, true, false) {selected=true;}
else {selected=false;}

if instance_exists(obj_hero)
{
	with(obj_hero) {scr_init_hero();}
	strength1=obj_hero.weapon.atk_dmg_light*obj_hero.str;
	strength2=(obj_hero.weapon.atk_dmg_strong+obj_hero.weapon.atk_dmg_variation)*obj_hero.str;
	resistance=obj_hero.res*(obj_hero.armor.defence+obj_hero.helm.defence);
	weight=obj_hero.armor.weight+obj_hero.helm.weight+obj_hero.weapon.weight;
	herospeed=obj_hero.spd*(1-((obj_hero.armor.weight+obj_hero.helm.weight+obj_hero.weapon.weight)/100));
}

// ---- gamepad menu cursor ----
if (!variable_instance_exists(id, "menu_cursor")) menu_cursor = 0;

if (global.using_gamepad)
{
	// right stick edge detection
	if (!variable_instance_exists(id, "_rs_ph")) { _rs_ph = 0; _rs_pv = 0; }
	var _rh = gamepad_axis_value(0, gp_axisrh);
	var _rv = gamepad_axis_value(0, gp_axisrv);
	var _rs_left  = (_rh < -0.5 && _rs_ph >= -0.5);
	var _rs_right = (_rh >  0.5 && _rs_ph <=  0.5);
	var _rs_up    = (_rv < -0.5 && _rs_pv >= -0.5);
	var _rs_down  = (_rv >  0.5 && _rs_pv <=  0.5);
	_rs_ph = _rh; _rs_pv = _rv;

	// ---- BUG 6 FIX: build valid cursor positions from existing button instances ----
	var _valid = [0]; // AWAKEN (obj_ui_menu_button_room) always exists

	if (instance_exists(obj_ui_menu_button_gear))
	{
		var _has = [false, false, false];
		with (obj_ui_menu_button_gear) { _has[type] = true; }
		if (_has[2]) array_push(_valid, 1); // helm = cursor 1
		if (_has[1]) array_push(_valid, 2); // armor = cursor 2
		if (_has[0]) array_push(_valid, 3); // weapon = cursor 3
	}

	if (instance_exists(obj_ui_menu_button_charselect))
		array_push(_valid, 4);

	// BUG 4 FIX: cursor 5 for reset/random (story_progress==5)
	if (instance_exists(obj_ui_menu_button_gotoreset) || instance_exists(obj_ui_menu_button_random))
		array_push(_valid, 5);

	// find current position in valid list
	var _idx = 0;
	for (var _i = 0; _i < array_length(_valid); _i++)
	{ if (_valid[_i] == menu_cursor) { _idx = _i; break; } }

	// D-pad up/down navigates within valid positions only
	if (gamepad_button_check_pressed(0, gp_padu) || keyboard_check_pressed(vk_up) || _rs_up)
	{ _idx += 1; if (_idx >= array_length(_valid)) _idx = 0; }
	if (gamepad_button_check_pressed(0, gp_padd) || keyboard_check_pressed(vk_down) || _rs_down)
	{ _idx -= 1; if (_idx < 0) _idx = array_length(_valid) - 1; }

	menu_cursor = _valid[_idx];

	// D-pad left/right cycles equipment, character, or reset/random sub-selection
	var _dir_input = 0;
	if (gamepad_button_check_pressed(0, gp_padl) || keyboard_check_pressed(vk_left) || _rs_left) _dir_input = -1;
	if (gamepad_button_check_pressed(0, gp_padr) || keyboard_check_pressed(vk_right) || _rs_right) _dir_input = 1;

	if (_dir_input != 0)
	{
		if (menu_cursor >= 1 && menu_cursor <= 3)
		{
			// gear rows: cursor 1=type2(helm), 2=type1(armor), 3=type0(weapon)
			var _target_type = 3 - menu_cursor;
			with (obj_ui_menu_button_gear)
			{
				if (type == _target_type) { nextdir = _dir_input; }
			}
		}
		if (menu_cursor == 4)
		{
			// character select row
			with (obj_ui_menu_button_charselect) { nextdir = _dir_input; }
		}
		if (menu_cursor == 5)
		{
			// BUG 4: left/right toggles between reset (0) and random (1)
			if (!variable_instance_exists(id, "menu_cursor_lr")) menu_cursor_lr = 0;
			if (_dir_input == -1) menu_cursor_lr = 0; // left = Reset Save
			if (_dir_input ==  1) menu_cursor_lr = 1; // right = Random Gear
		}
	}

	// BUG 4: A-button on cursor 5 activates the selected sub-button
	if (menu_cursor == 5 && global.action_released)
	{
		if (!variable_instance_exists(id, "menu_cursor_lr")) menu_cursor_lr = 0;
		if (menu_cursor_lr == 0 && instance_exists(obj_ui_menu_button_gotoreset))
		{
			room_goto(rm_menu_deletesave);
		}
		else if (menu_cursor_lr == 1 && instance_exists(obj_ui_menu_button_random))
		{
			with (obj_ui_menu_button_random) { nextclick = true; }
		}
	}
	
	// A on equipment/character rows = cycle forward
	//if (global.action_released && menu_cursor >= 1)
	//{
	//	if (menu_cursor <= 3)
	//	{
	//		var _a_type = 3 - menu_cursor;
	//		with (obj_ui_menu_button_gear) { if (type == _a_type) nextdir = 1; }
	//	}
	//	if (menu_cursor == 4)
	//	{
	//		with (obj_ui_menu_button_charselect) { nextdir = 1; }
	//	}
	//}
}