// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_controls_main(){
}

function scr_gamepad_move(_speed){
	// don't move while A/Space is held (blocking/charging)
	if (global.action_held) return;
	// don't move while shop is open
	var _shop_open = false;
	if (instance_exists(obj_ui_shop)) { with (obj_ui_shop) { if (shop_active == 1) _shop_open = true; } }
	if (_shop_open) return;

	// read direction from stick + d-pad + WASD
	var _h = gamepad_axis_value(0, gp_axislh);
	var _v = gamepad_axis_value(0, gp_axislv);
	if (gamepad_button_check(0, gp_padl)) _h = -1;
	if (gamepad_button_check(0, gp_padr)) _h =  1;
	if (gamepad_button_check(0, gp_padu)) _v = -1;
	if (gamepad_button_check(0, gp_padd)) _v =  1;
	if (keyboard_check(ord("A")) || keyboard_check(vk_left))  _h = -1;
	if (keyboard_check(ord("D")) || keyboard_check(vk_right)) _h =  1;
	if (keyboard_check(ord("W")) || keyboard_check(vk_up))    _v = -1;
	if (keyboard_check(ord("S")) || keyboard_check(vk_down))  _v =  1;

	var _mag = sqrt(_h * _h + _v * _v);

	// dead zone — force idle when stick is released
	if (_mag < 0.15)
	{
		if (global.using_gamepad && (state == states.walk || state == states.run))
		{
			path_end();
			speed = 0;
			state = states.idle;
		}
		return;
	}

	// clamp to unit circle
	if (_mag > 1) { _h /= _mag; _v /= _mag; _mag = 1; }

	// compute speed from CHARACTER STATS — not from _speed parameter
	// this matches the speed that scr_character_move uses for pathfinding
	var _base_walk = (walk_sp + (spd * defence_speed * walk_sp_mod * 0.25)) * 2 * walk_sp_mod;
	var _base_run  = (run_sp  + (spd * defence_speed * walk_sp_mod * 0.25)) * 2 * walk_sp_mod;
	var _move_speed;

	if (_mag > .99)
	{
		_move_speed = _base_run * _mag;
		state = states.run;
	}
	else
	{
		_move_speed = _base_walk * (_mag / .99);
		state = states.walk;
	}

	// stop any active pathfinding
	path_end();
	speed = 0;

	// direct movement with wall sliding
	var _dx = _h * _move_speed;
	var _dy = _v * _move_speed * 0.85; // isometric Y correction

	if (!place_meeting(x + _dx, y + _dy, obj_collider))
	{
		x += _dx; y += _dy;
	}
	else if (_dx != 0 && !place_meeting(x + _dx, y, obj_collider))
	{
		x += _dx;
	}
	else if (_dy != 0 && !place_meeting(x, y + _dy, obj_collider))
	{
		y += _dy;
	}

	// set dest to current pos so scr_character_move doesn't interfere
	dest_x = x;
	dest_y = y;

	// face movement direction
	if (_h < -0.1) dir = 1;
	if (_h >  0.1) dir = -1;
	if (_v < -0.1) back = true;
	if (_v >  0.1) back = false;
}


function scr_refresh_cursor(){
	global.cursor_x=mouse_x;
	global.cursor_y=mouse_y;
	global.gamepad_used=false;
	
	if (gamepad_is_connected(0)) && instance_exists(obj_hero) {
		
		var gamepad_distance = 50;
		var gamepad_distance_modifier = 0;
				
	    if (abs(gamepad_axis_value(0, gp_axislh)) > 0.1)
		|| (abs(gamepad_axis_value(0, gp_axislv)) > 0.1)
		|| (abs(gamepad_button_check(0,gp_face1)) > 0.1)
		{
	        // Axis is being moved
			global.gamepad_used=true;
			gamepad_distance_modifier=gamepad_button_check(0,gp_shoulderrb)*gamepad_distance;
			global.cursor_x=obj_hero.x+((gamepad_distance+gamepad_distance_modifier)*gamepad_axis_value(0, gp_axislh));
			global.cursor_y=obj_hero.y+((gamepad_distance+gamepad_distance_modifier)*gamepad_axis_value(0, gp_axislv)*.5);
	    }
	}
}

function scr_button_pressed(_mouse_button=mb_any){
	if mouse_check_button_pressed(_mouse_button) {return true;}
	if global.gamepad_used==true
	{
		if gamepad_button_check_pressed(0,gp_face1) {return true;}
	}
}

function scr_button_released(_mouse_button=mb_any){
	if mouse_check_button_released(_mouse_button) {return true;}
	if global.gamepad_used==true
	{
		if gamepad_button_check_released(0,gp_face1) {return true;}
	}
}

function scr_button(_mouse_button=mb_any){
	if mouse_check_button(_mouse_button) {return true;}
	if global.gamepad_used==true
	{
		if gamepad_button_check(0,gp_face1) {return true;}
	}
}

function scr_input_update(){
	// ---- detect which device is active ----
	// mouse activity switches to mouse mode
	if (mouse_check_button(mb_any) || mouse_check_button_pressed(mb_any) || mouse_check_button_released(mb_any)
	|| abs(mouse_x - global._prev_mouse_x) > 1
	|| abs(mouse_y - global._prev_mouse_y) > 1)
	{
		global.using_gamepad = false;
	}
	global._prev_mouse_x = mouse_x;
	global._prev_mouse_y = mouse_y;
	
	// mouse movement shows cursor
	var _dmx = display_mouse_get_x();
	var _dmy = display_mouse_get_y();
	if (!variable_global_exists("_prev_dmx")) { global._prev_dmx = _dmx; global._prev_dmy = _dmy; }
	if (_dmx != global._prev_dmx || _dmy != global._prev_dmy)
	{ global.using_gamepad = false; }
	global._prev_dmx = _dmx;
	global._prev_dmy = _dmy;

	// gamepad or keyboard activity switches to gamepad mode
	if (gamepad_button_check(0, gp_face1)
	|| abs(gamepad_axis_value(0, gp_axislh)) > 0.5
	|| abs(gamepad_axis_value(0, gp_axislv)) > 0.5
	|| gamepad_button_check(0, gp_padu)
	|| gamepad_button_check(0, gp_padd)
	|| gamepad_button_check(0, gp_padl)
	|| gamepad_button_check(0, gp_padr)
	|| keyboard_check(vk_space)
	|| keyboard_check(ord("W"))
	|| keyboard_check(ord("A"))
	|| keyboard_check(ord("S"))
	|| keyboard_check(ord("D"))
	|| keyboard_check(vk_up)
	|| keyboard_check(vk_down)
	|| keyboard_check(vk_left)
	|| keyboard_check(vk_right))
	{
		global.using_gamepad = true;
	}

	// ---- action button (A / Space / mouse click) ----
	if (global.using_gamepad)
	{
		global.action_pressed  = gamepad_button_check_pressed(0, gp_face1) || keyboard_check_pressed(vk_space);
		global.action_released = gamepad_button_check_released(0, gp_face1) || keyboard_check_released(vk_space);
		global.action_held     = gamepad_button_check(0, gp_face1) || keyboard_check(vk_space);
	}
	else
	{
		global.action_pressed  = mouse_check_button_pressed(mb_any);
		global.action_released = mouse_check_button_released(mb_any);
		global.action_held     = mouse_check_button(mb_any);
	}

	// ---- cursor position ----
	if (global.using_gamepad && instance_exists(obj_hero))
	{
		// read direction from stick + d-pad + WASD
		var _h = gamepad_axis_value(0, gp_axislh);
		var _v = gamepad_axis_value(0, gp_axislv);
		if (gamepad_button_check(0, gp_padl)) _h = -1;
		if (gamepad_button_check(0, gp_padr)) _h =  1;
		if (gamepad_button_check(0, gp_padu)) _v = -1;
		if (gamepad_button_check(0, gp_padd)) _v =  1;
		if (keyboard_check(ord("A")) || keyboard_check(vk_left))  _h = -1;
		if (keyboard_check(ord("D")) || keyboard_check(vk_right)) _h =  1;
		if (keyboard_check(ord("W")) || keyboard_check(vk_up))    _v = -1;
		if (keyboard_check(ord("S")) || keyboard_check(vk_down))  _v =  1;

		// clamp to unit circle
		var _len = sqrt(_h * _h + _v * _v);
		if (_len > 1) { _h /= _len; _v /= _len; }

		// cursor = hero position + direction * range
		// range is 50px — well above swipe_threshold (10px)
		var _range = 50;
		global.direction_active = (_len > 0.15);
		global.cursor_x = obj_hero.x + _h * _range;
		global.cursor_y = obj_hero.y + _v * _range;
	}
	else
	{
		if (global.widescreen && view_get_visible(0))
		{
			// calculate correct room coordinates from screen mouse position
			var _wmx = window_mouse_get_x();
			var _wmy = window_mouse_get_y();
			var _dw = display_get_width();
			var _dh = display_get_height();
			var _scale = floor(_dh / 320);
			if (_scale < 1) _scale = 1;
			var _game_w = global.res_x * _scale;
			var _game_h = global.res_y * _scale;
			var _game_x = floor((_dw - _game_w) / 2);
			var _game_y = floor((_dh - _game_h) / 2);

			var _nx = (_wmx - _game_x) / _game_w;
			var _ny = (_wmy - _game_y) / _game_h;

			var _vx = camera_get_view_x(view_camera[0]);
			var _vy = camera_get_view_y(view_camera[0]);
			var _vw = camera_get_view_width(view_camera[0]);
			var _vh = camera_get_view_height(view_camera[0]);

			// The visible area is res_x × res_y cropped from center of the full view
			var _crop_x = (_vw - global.res_x) * 0.5;
			var _crop_y = (_vh - global.res_y) * 0.5;
			global.cursor_x = _vx + _crop_x + _nx * global.res_x;
			global.cursor_y = _vy + _crop_y + _ny * global.res_y;
		}
		else
		{
			global.cursor_x = mouse_x;
			global.cursor_y = mouse_y;
		}
		global.direction_active = false;
	}
}