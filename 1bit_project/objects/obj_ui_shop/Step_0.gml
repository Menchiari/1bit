depth=ui_depth;//global.depth_ui_front;
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

if instance_exists(obj_hero)
{
	if point_distance(obj_hero.x,obj_hero.y,xoriginal,yoriginal)<active_range
	{
		var othershop=collision_circle(x,y,active_range,obj_ui_shop,true,true)
		if othershop==true
		{
			if point_distance(xoriginal,yoriginal,obj_hero.x,obj_hero.y)<point_distance(othershop.x,othershop.y,obj_hero.x,obj_hero.y) {active=1;}
			else {active=0; shop_active=0;}
		}
		else {active=1;}
	}
	else {active=0; shop_active=0;}
}

if collision_circle(xoriginal,yoriginal,reactive_range,obj_enemy,false,true) {active=0; shop_active=0;}

if active==1
{
	if mouse_check_button_released(mb_any)
	&& point_in_circle(mouse_x,mouse_y,x,y,radius)
	&& shop_active!=1
	{shop_active=1;}
	// gamepad: A opens shop when hero is near
	var _just_opened = false;
	if (global.action_released && global.using_gamepad && active==1 && shop_active!=1)
	{
		shop_active=1;
		_just_opened = true;
		if (instance_exists(obj_hero))
		{ obj_hero.state = states.idle; obj_hero.dest_x = obj_hero.x; obj_hero.dest_y = obj_hero.y; obj_hero.speed = 0; }
	}
	
	if shop_active==1
	{	
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
		// gamepad shop navigation
		var _gamepad_equip = false;
		if (global.using_gamepad && shop_active==1 && !_just_opened)
		{
			// stick edge detection (both sticks)
			if (!variable_instance_exists(id, "_ls_ph")) { _ls_ph = 0; _ls_pv = 0; _rs_ph = 0; _rs_pv = 0; }
			var _lh = gamepad_axis_value(0, gp_axislh);
			var _lv = gamepad_axis_value(0, gp_axislv);
			var _rh = gamepad_axis_value(0, gp_axisrh);
			var _rv = gamepad_axis_value(0, gp_axisrv);
			var _stick_left  = (_lh < -0.5 && _ls_ph >= -0.5) || (_rh < -0.5 && _rs_ph >= -0.5);
			var _stick_right = (_lh >  0.5 && _ls_ph <=  0.5) || (_rh >  0.5 && _rs_ph <=  0.5);
			var _stick_up    = (_lv < -0.5 && _ls_pv >= -0.5) || (_rv < -0.5 && _rs_pv >= -0.5);
			var _stick_down  = (_lv >  0.5 && _ls_pv <=  0.5) || (_rv >  0.5 && _rs_pv <=  0.5);
			_ls_ph = _lh; _ls_pv = _lv;
			_rs_ph = _rh; _rs_pv = _rv;
			// D-pad left/right selects column
			if (gamepad_button_check_pressed(0, gp_padl) || keyboard_check_pressed(vk_left) || _stick_left)
			{
				if (chosen_column == 3) chosen_column = 2;
				else { chosen_column -= 1; if (chosen_column < 0) chosen_column = 2; }
				audio_play_sound(snd_click,10,false,global.audio_ui*.07);
			}
			if (gamepad_button_check_pressed(0, gp_padr) || keyboard_check_pressed(vk_right) || _stick_right)
			{
				if (chosen_column == 3) chosen_column = 0;
				else { chosen_column += 1; if (chosen_column > 2) chosen_column = 0; }
				audio_play_sound(snd_click,10,false,global.audio_ui*.07);
			}
			// D-pad up: deselect
			if (gamepad_button_check_pressed(0, gp_padu) || keyboard_check_pressed(vk_up) || _stick_up)
			{ chosen_column = 3; }
			// D-pad down: toggle stats
			if (gamepad_button_check_pressed(0, gp_padd) || keyboard_check_pressed(vk_down) || _stick_down)
			{ stats = !stats; }
			// A: equip or close if in description
			if (global.action_released)
			{
				if (chosen_column < 3)
				{ button_pressed = 1; _gamepad_equip = true; }
				else
				{ shop_active = 0; if instance_exists(obj_hero) { obj_hero.state = states.idle; obj_hero.dest_x = obj_hero.x; obj_hero.dest_y = obj_hero.y; } }
			}
			// B: close
			if (gamepad_button_check_released(0, gp_face2) || keyboard_check_released(vk_escape))
			{
				shop_active = 0; chosen_column = 3;
				if instance_exists(obj_hero) { obj_hero.state = states.idle; obj_hero.dest_x = obj_hero.x; obj_hero.dest_y = obj_hero.y; }
			}
		}
		if (mouse_check_button_released(mb_any) || _gamepad_equip)
		{
			audio_play_sound(snd_click,10,false,global.audio_ui*.07);
			
			if instance_exists(obj_hero)
			{
				//make hero still
				if point_in_rectangle(mouse_x,mouse_y,x-xoff+19,y-yoff+13,x-xoff+110,by1)//y-yoff+85)
				|| point_in_circle(mouse_x,mouse_y,x,y,radius)
				{obj_hero.state=states.idle; obj_hero.dest_x=obj_hero.x;obj_hero.dest_y=obj_hero.y;}
				else if (!_gamepad_equip) {active=0; shop_active=0;obj_hero.state=states.idle; obj_hero.dest_x=obj_hero.x;obj_hero.dest_y=obj_hero.y;}
				
				if button_pressed==1
				{
					//exchange weapon/armor/etc
					switch(chosen_column)
					{
						case 0:
							var shop_weapon=weapon;
							
							if ds_list_find_index(global.unlock_wpn,shop_weapon.index) = -1
							{ds_list_add(global.unlock_wpn,shop_weapon.index);}
											
							
							equip_weapon(obj_hero.weapon);
							with (obj_hero)
							{
								equip_weapon(shop_weapon);
								global.player_weapon = global.weapons[weapon.index];
							}
							slot_name[0]=weapon.name;
							slot_description[0]=weapon.description;
							//AUDIO
							var _pitch=clamp(2-(shop_weapon.weight/10),.75,2);
							var _vol_wpn=global.audio_ui*.25;
							if shop_weapon.weapon_animset==weapons_animset.dagger {audio_play_sound(snd_equip_knife,10,false,_vol_wpn,0,_pitch);}
							if shop_weapon.weapon_animset==weapons_animset.sword {audio_play_sound(snd_equip_sword,10,false,_vol_wpn,0,_pitch);}
							if shop_weapon.weapon_animset==weapons_animset.katana {audio_play_sound(snd_equip_sword,10,false,_vol_wpn,0,_pitch);}
							if shop_weapon.weapon_animset==weapons_animset.stick {audio_play_sound(snd_equip_stick,10,false,_vol_wpn,0,_pitch);}
							if shop_weapon.weapon_animset==weapons_animset.shotgun {audio_play_sound(snd_equip_shotgun,10,false,_vol_wpn,0,_pitch);}
							show_debug_message("audio weapon sound");
						break;
						case 1:
							var shop_armor=armor;
							
							if ds_list_find_index(global.unlock_arm,shop_armor.index) = -1
							{ds_list_add(global.unlock_arm,shop_armor.index);}
							
							equip_armor(obj_hero.armor);
							with (obj_hero)
							{
								equip_armor(shop_armor);
								global.player_armor  = global.armors[armor.index];
							}
							slot_name[1]=armor.name;
							slot_description[1]=armor.description;
							//AUDIO
							var _pitch_arm=clamp(1.5-(shop_armor.weight/50),.75,1.5);
							var _vol_arm=global.audio_ui*.4;

							if shop_armor.material==armors_material.cloth {audio_play_sound(snd_equip_cloth,2,false,_vol_arm,0,_pitch_arm);}
							if shop_armor.material==armors_material.leather {audio_play_sound(snd_equip_vest,2,false,_vol_arm,0,_pitch_arm);}
							if shop_armor.material==armors_material.cape {audio_play_sound(snd_equip_cape,2,false,_vol_arm,0,_pitch_arm);}
							if shop_armor.material==armors_material.ceramic {audio_play_sound(snd_equip_vest,2,false,_vol_arm,0,_pitch_arm);}
							if shop_armor.material==armors_material.chainmail {audio_play_sound(snd_equip_chainmail,2,false,_vol_arm,0,_pitch_arm);show_debug_message("CHAINMAIL!!!")}
							if shop_armor.material==armors_material.metal_thin {audio_play_sound(snd_equip_armor,2,false,_vol_arm,0,_pitch_arm);}
							if shop_armor.material==armors_material.metal_thick {audio_play_sound(snd_equip_armor,2,false,_vol_arm,0,_pitch_arm);}
							if shop_armor.material==armors_material.wood {audio_play_sound(snd_equip_vest,2,false,_vol_arm,0,_pitch_arm);}
							show_debug_message("audio armor sound for "+string(shop_armor.material)+string(armors_material.cape));
						break;
						case 2:
							var shop_helm=helm;
							
							if ds_list_find_index(global.unlock_hlm,shop_helm.index) = -1
							{ds_list_add(global.unlock_hlm,shop_helm.index);}
							
							equip_helm(obj_hero.helm);
							with (obj_hero)
							{
								equip_helm(shop_helm);
								global.player_helm   = global.helms[helm.index];
							}
							slot_name[2]=helm.name;
							slot_description[2]=helm.description;
							//AUDIO
							var _pitch_hlm=clamp(1+(shop_helm.weight/10),1,1.5);
							var _vol_hlm=global.audio_ui*.5;
							audio_play_sound(snd_equip_hlm,10,false,_vol_hlm,0,_pitch_hlm);
							show_debug_message("audio helm sound");
						break;
						default:
							active=0;
							shop_active=0;
						break;
					}
					
					//active=0;
					//shop_active=0;
					button_pressed=0;
					
					scr_savegame();
				}
			}
			else
			{
				scr_savegame();
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
			var cam = view_camera[0]; // main view
			x = camera_get_view_x(cam) + camera_get_view_width(cam) / 2;
			y = camera_get_view_y(cam) + camera_get_view_height(cam) - sprite_height / 2;
		}
		//Avoids it remaining active when pressed where the arrow usually is at x,y
		if mouse_check_button_released(mb_any) && point_in_circle(mouse_x,mouse_y,x,y,radius) {shop_active=0;}
		
		//Avoids other text being active
		with obj_character {speech_visible=false;}
	}
	else
	{
		x=xoriginal;
		y=yoriginal;
	}
}

//destroys the shop if there is nothing there
if weapon.index==0 && armor.index==0 && helm.index==0 {instance_destroy();}