/// @description 
if mouse_check_button(mb_any) && collision_point(mouse_x,mouse_y,self,true,false) {selected=true;}
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

	// D-pad up/down navigates rows
	// 0=AWAKEN, 1=helm, 2=armor, 3=weapon, 4=character
	if (gamepad_button_check_pressed(0, gp_padu) || keyboard_check_pressed(vk_up) || _rs_up)
	{ menu_cursor += 1; if (menu_cursor > 4) menu_cursor = 0; }
	if (gamepad_button_check_pressed(0, gp_padd) || keyboard_check_pressed(vk_down) || _rs_down)
	{ menu_cursor -= 1; if (menu_cursor < 0) menu_cursor = 4; }

	// D-pad left/right cycles equipment or character on focused row
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