// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_block_controls(){
	if control==controls.touch
	{
		if (!global.using_gamepad || point_distance(global.cursor_x, global.cursor_y, click_x, click_y) > 2)
		{
			if global.cursor_x < click_x {dir=1}
			else {dir=-1};
			if global.cursor_y < click_y {back=true}
			else {back=false};
		}
			
		//if mouse_check_button_released(mb_any)
		if global.action_released
		{	
			//click_x=mouse_x;click_y=mouse_y;
			//dest_x=mouse_x;dest_y=mouse_y;
			dest_x=global.cursor_x;dest_y=global.cursor_y;
			scr_flip_check_mouse(dest_x,dest_y,1);
			//dest_x=mouse_x;
			//dest_y=mouse_y;
			dest_x=global.cursor_x;
			dest_y=global.cursor_y;

			//if point_distance(click_x,click_y,mouse_x,mouse_y)<swipe_threshold
			if point_distance(click_x,click_y,global.cursor_x,global.cursor_y)<swipe_threshold
			{
				if timer<roll_time
				{
					//if point_distance(x,y,mouse_x,mouse_y)>run_distance
					if point_distance(x,y,global.cursor_x,global.cursor_y)>run_distance
					{
						state=states.run;
					}
					else
					{
						state=states.walk;
						var temp_enemy=collision_circle(x,y,run_distance_enemy,obj_enemy,false,true)//todo make opposing faction rather than just enemy faction
						if instance_exists(temp_enemy)
						{
							if temp_enemy.ai_state=ai_states.alert
							|| temp_enemy.ai_state=ai_states.chase
							|| temp_enemy.ai_state=ai_states.fight
							|| temp_enemy.ai_state=ai_states.flee
							{state=states.run;}
						}
					}
					
					// extra check for hero character to adjust destination beyond the camera boundary if necessary
					if (object_index == obj_hero && instance_exists(obj_camera) && obj_camera.followcam == false) {
						// first, check to see if we should move again to cross a camera boundary
						var _check_ahead_pixels = 32;		// pixel distance to check ahead of character
						var _slide_direction = -1;
						
						for (var _check_dir = 0; _check_dir < 360; _check_dir += 90) {
							var _x_check = dest_x + lengthdir_x(_check_ahead_pixels, _check_dir);
							var _y_check = dest_y + lengthdir_y(_check_ahead_pixels, _check_dir);
							
							if (_x_check != dest_x && sign(x - dest_x) != sign(x - _x_check)) {
								continue;
							}
							if (_y_check != dest_y && sign(y - dest_y) != sign(y - _y_check)) {
								continue;
							}
							
							if (!point_in_rectangle(_x_check, _y_check, obj_camera.x - global.res_x / 2, obj_camera.y - global.res_y / 2,
									obj_camera.x + global.res_x / 2, obj_camera.y + global.res_y / 2)) {
								_slide_direction = _check_dir;
								break;
							}
						}
						
						if (collision_line(dest_x, dest_y, _x_check, _y_check, obj_avoid, true, true)) {
							// encountered a collision between the original destination point and the new one, reset
							_slide_direction = -1;
						}
						
						var _move_ahead_pixels = 16;		// pixel distance to move character past the camera boundary
						switch (_slide_direction) {
							case (0): dest_x = obj_camera.x + global.res_x / 2 + _move_ahead_pixels; break;
							case (180): dest_x = obj_camera.x - global.res_x / 2 - _move_ahead_pixels; break;
							case (90): dest_y = obj_camera.y - global.res_y / 2 - _move_ahead_pixels; break;
							case (270): dest_y = obj_camera.y + global.res_y / 2 + _move_ahead_pixels; break;
						}
						
						// recalculate run / walk
						if (point_distance(x, y, dest_x, dest_y) > run_distance) {
							state=states.run;
						} else {
							state=states.walk;
						}
					}
				}
				else
				{
					var temp_enemy=collision_circle(x,y,attack_range_strong*2,obj_enemy,true,true)
					if instance_exists(temp_enemy)
					{
						image_index=0;
						var move_speed=0;
						if timer>atk2_time {state=states.attack_strong;move_speed=atk2_sp;}
						else if timer>atk1_time {state=states.attack;}
						else
						{
							alarm[3]=blocking_timer;
							if blocking==false
							{
								blocking=true;
							}
							timer=0;
							state=states.idle;
						}
						dest_x=temp_enemy.x;
						dest_y=temp_enemy.y;
					}
					else
					{					
						alarm[3]=blocking_timer;
						if blocking==true
						{
							blocking=false;
						}
						timer=0;
						state=states.idle;
					}
				}
			}
			else 
			{
				image_index=0;
				var move_speed=0;
				if timer>atk2_time {state=states.attack_strong;move_speed=atk2_sp;}
				else if timer>atk1_time {state=states.attack;}
				else {state=states.roll;}
				dest_x=x-(click_x-dest_x);
				dest_y=y-(click_y-dest_y);
			}
		}
	}
	else if control==controls.gamepad
	{
	//gamepad controls
	}
	
	else if control==controls.keyboard
	{
	//keyboard controls
	}
}