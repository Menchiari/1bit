depth=ui_depth;

x0=x-xoff+21;
x1=x-xoff+50;
x2=x-xoff+78;
x3=x-xoff+107;
y0=y-yoff+24;
y1=y-yoff+42;
bx0=x-xoff+22;
bx1=x-xoff+106;
by0=y-yoff+69;
by1=y-yoff+85;

tx1=x-xoff+20;
ty1=y-yoff+13;
tx2=x-xoff+109;
ty2=y-yoff+24;

cx1=x-xoff+20;
cy1=y-yoff+42;
cx2=x-xoff+109;
cy2=y-yoff+68;

if mouse_check_button(mb_any) && point_in_rectangle(mouse_x,mouse_y,bx0,by0,bx1,by1) {selecting=true;}
else {selecting=false;}

// init gamepad locals
if (!variable_instance_exists(id, "_just_opened")) _just_opened = false;
if (!variable_instance_exists(id, "_gamepad_equip")) _gamepad_equip = false;
if (!variable_instance_exists(id, "_ls_ph")) { _ls_ph = 0; _rs_ph = 0; }
if (_just_opened && !global.action_pressed && !global.action_held) _just_opened = false;

// gamepad: open with A when near
if (global.using_gamepad && active == 1 && shop_active == 0 && global.action_pressed)
{
	shop_active = 1;
	_just_opened = true;
	if (instance_exists(obj_hero)) { obj_hero.state = states.idle; obj_hero.dest_x = obj_hero.x; obj_hero.dest_y = obj_hero.y; }
}

if instance_exists(obj_hero)
{
	if point_distance(obj_hero.x,obj_hero.y,xoriginal,yoriginal)<active_range
	{
		var othershop=collision_circle(x,y,active_range,obj_ui_shop,true,true)
		if othershop==true
		{
			if point_distance(xoriginal,yoriginal,obj_hero.x,obj_hero.y)<point_distance(othershop.x,othershop.y,obj_hero.x,obj_hero.y) {active=1;}
			else {active=0;}
		}
		else {active=1;}
	}
	else {active=0;}
}
if collision_circle(x,y,reactive_range,obj_enemy,false,true) {active=0; shop_active=0;}

if active==1
{
	if mouse_check_button_released(mb_any) && point_in_circle(mouse_x,mouse_y,x,y,radius) {shop_active=1;}
	if shop_active==1
	{
		_gamepad_equip = false;

		// --- GAMEPAD CONTROLS ---
		if (global.using_gamepad && !_just_opened)
		{
			// d-pad / stick column navigation
			var _lsx = gamepad_axis_value(0, gp_axislh);
			var _rsx = gamepad_axis_value(0, gp_axisrh);
			var _ls_now = (_lsx < -0.5) ? -1 : ((_lsx > 0.5) ? 1 : 0);
			var _rs_now = (_rsx < -0.5) ? -1 : ((_rsx > 0.5) ? 1 : 0);
			var _dp_l = gamepad_button_check_pressed(0, gp_padl);
			var _dp_r = gamepad_button_check_pressed(0, gp_padr);
			var _move = 0;
			if (_dp_l) _move = -1;
			else if (_dp_r) _move = 1;
			else if (_ls_now != 0 && _ls_ph == 0) _move = _ls_now;
			else if (_rs_now != 0 && _rs_ph == 0) _move = _rs_now;
			_ls_ph = _ls_now;
			_rs_ph = _rs_now;

			if (_move != 0)
			{
				chosen_column = (chosen_column + _move + 4) mod 4;
				audio_play_sound(snd_click, 10, false, global.audio_ui * 0.07);
			}

			// A: confirm selection
			if (global.action_pressed)
			{
				_gamepad_equip = true;
				if (chosen_column == 3) { button_pressed = 1; }
				else { button_pressed = 0; }
				audio_play_sound(snd_click, 10, false, global.audio_ui * 0.1);
			}

			// B: close
			if (gamepad_button_check_pressed(0, gp_face2))
			{
				shop_active = 0;
				active = 0;
				if (instance_exists(obj_hero)) { obj_hero.state = states.idle; obj_hero.dest_x = obj_hero.x; obj_hero.dest_y = obj_hero.y; }
			}
		}

		// --- MOUSE CONTROLS ---
		if mouse_check_button_released(mb_any)
		{
			if point_in_rectangle(mouse_x,mouse_y,x0,y0,x1,y1) {if chosen_column==0 chosen_column=3 else chosen_column=0;}
			if point_in_rectangle(mouse_x,mouse_y,x1,y0,x2,y1) {if chosen_column==1 chosen_column=3 else chosen_column=1;}
			if point_in_rectangle(mouse_x,mouse_y,x2,y0,x3,y1) {if chosen_column==2 chosen_column=3 else chosen_column=2;}
			if point_in_rectangle(mouse_x,mouse_y,tx1,ty1,tx2,ty2) {chosen_column=3;}
			if point_in_rectangle(mouse_x,mouse_y,cx1,cy1,cx2,cy2) {stats=!stats;}
			if point_in_rectangle(mouse_x,mouse_y,bx0,by0,bx1,by1) {button_pressed=1;}
			else {button_pressed=0;}
		}

		// --- ACTION (mouse click OR gamepad A) ---
		if (mouse_check_button_released(mb_any) || _gamepad_equip)
		{
			audio_play_sound(snd_click,10,false,global.audio_ui*.1);

			if instance_exists(obj_hero)
			{
				// keep hero still while in menu
				if (!_gamepad_equip)
				{
					if point_in_rectangle(mouse_x,mouse_y,x-xoff+19,y-yoff+13,x-xoff+110,by1)
					|| point_in_circle(mouse_x,mouse_y,x,y,radius)
					{obj_hero.state=states.idle; obj_hero.dest_x=obj_hero.x;obj_hero.dest_y=obj_hero.y;}
					else {active=0; shop_active=0;}
				}

				if button_pressed==1
				{
					audio_play_sound(snd_vox_hired,10,false,global.audio_ui*.3,0,voice_pitch_hired);
					mercenary.ai_state_original=ai_states.follow;
					mercenary.ai_state=ai_states.follow;
					mercenary.state=states.idle;
					mercenary.control=controls.ai;
					mercenary.faction=factions.ally;
					instance_destroy();
				}
			}
			else
			{
				instance_destroy();
			}
		}

		if instance_exists(obj_camera)
		{
			x=obj_camera.x;
			y=obj_camera.y+sprite_height/2;
		}
		else
		{
			var cam = view_camera[0];
			x = camera_get_view_x(cam) + camera_get_view_width(cam) / 2;
			y = camera_get_view_y(cam) + camera_get_view_height(cam) - sprite_height / 2;
		}

		// mouse: close when clicking the arrow area
		if mouse_check_button_released(mb_any) && point_in_circle(mouse_x,mouse_y,x,y,radius) {shop_active=0;}
	}
	else
	{
		if instance_exists(mercenary)
		{
			xoriginal=mercenary.x;
			yoriginal=mercenary.y-7;
		}
		x=xoriginal;
		y=yoriginal;
	}
}