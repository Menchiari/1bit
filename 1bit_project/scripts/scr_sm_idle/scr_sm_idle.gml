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

	//movement
	if speed>.5 {speed-=idle_sp_decrease;}
	else if speed<-.5 {speed+=idle_sp_decrease;}
	else{speed=0;path_end();}

	//controls
	if control==controls.touch
	{
		if mouse_pressed=true
		{
			click_x=mouse_x;click_y=mouse_y;
			scr_flip_check_mouse(dest_x,dest_y,1);
			state=states.block;
		}
	}
	
	if control==controls.ai
	{
		if collision_point(x,y,obj_character,false,true)
		{
			var chance=irandom_range(0,30)
			if chance<=1
			{
				state=states.walk;
				dest_x=x+irandom_range(-30,30);
				dest_y=y+irandom_range(-30,30);
			}
		}
	}
}