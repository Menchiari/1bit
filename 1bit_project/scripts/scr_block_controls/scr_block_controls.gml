// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_block_controls(){
	if control=controls.touch
	{
		if mouse_check_button_released(mb_any)
		{	
			dest_x=mouse_x;dest_y=mouse_y;
		
			scr_flip_check_mouse(dest_x,dest_y,1)
			dest_x=mouse_x;
			dest_y=mouse_y;
			if point_distance(click_x,click_y,mouse_x,mouse_y)<swipe_threshold
			{
				if timer<roll_time
				{
					if point_distance(x,y,mouse_x,mouse_y)>run_distance
					||collision_circle(x,y,run_distance_enemy,obj_enemy,false,true)//todo make opposing faction rather than just enemy faction
					{state=states.run;}
					else {state=states.walk;}
				}
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
	else if control=controls.gamepad
	{
	//gamepad controls
	}
	
	else if control=controls.keyboard
	{
	//keyboard controls
	}
}