function scr_sm_idle(){
	if blocking==true {scr_animation_loop(block_a,block_a);}
	else
	{
		if hp<hp_min {scr_animation_loop(breathe_a,breathe_b);}
		else{scr_animation_loop(idle_a,idle_b);}
	}
	image_speed=idle_speed;
	timer+=1;
	speech_visible=false;
	idle_timer-=1;

	//movement
	if speed>.5 {speed-=idle_sp_decrease;}
	else if speed<-.5 {speed+=idle_sp_decrease;}
	else{speed=0;path_end();}

	//controls
	if control==controls.touch
	{
		if mouse_pressed=true
		{
			//click_x=mouse_x;click_y=mouse_y;
			if (global.using_gamepad) { click_x=x; click_y=y; }
			else { click_x=global.cursor_x; click_y=global.cursor_y; }
			scr_flip_check_mouse(dest_x,dest_y,1);
			state=states.block;
			idle_timer=idle_timer_setup;
		}
			if idle_timer<=0
		{
			state=states.sit;
			idle_timer=idle_timer_setup;
		}
		
		//Gamepad test
		scr_gamepad_move(20);

	}
	
	if control==controls.ai
	{
		timer=idle_timer_setup;
		if collision_point(x,y,obj_character,false,true)
		{
			var chance=irandom_range(0,30)
			if chance<=1
			{
				state=states.walk;
				dest_x=x+irandom_range(-30,30);
				dest_y=y+irandom_range(-30,30);
				idle_timer=idle_timer_setup;
			}
		}
	}
}