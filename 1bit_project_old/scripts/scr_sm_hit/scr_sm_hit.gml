function scr_sm_hit(){
	
	if object_index==obj_hero && image_index==idle_hit_a+1
	{
		instance_create_depth(x,y,-y,obj_fx_screenshake);
		instance_create_depth(x,y,-y,obj_fx_flash);
	}

	timer+=1;
	scr_block_controls();


	if hp>0
	{
		scr_animation(idle_hit_a,idle_hit_b);
		image_speed=.25;
		scr_footsteps(idle_hit_a,idle_hit_b,1.5);
	
		if speed>1 {speed-=block_sp_decrease;}
		if speed<1 {speed+=block_sp_decrease;}
		else{speed=0;path_end();}
	
		if image_index==idle_hit_b-1
		{
			state=states.idle;
		}
	}
	else
	{
		state=states.death;
	}
}