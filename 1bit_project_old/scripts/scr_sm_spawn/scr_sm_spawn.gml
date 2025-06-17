function scr_sm_spawn(){
	x=round(x);
	y=round(y);
	if trigger_spawn==false
	{
		//wait for trigger
		image_speed=idle_speed;
		scr_animation_loop(trigger_spawn_idle_a,trigger_spawn_idle_b);
	}
	else
	{
		if image_index<trigger_spawn_a {image_index=trigger_spawn_a;}
		//play animation and go
		image_speed=random_range(.1,.5);
		if image_index>=trigger_spawn_b
		{
			image_index=0;
			state=states.idle;
		}
	}
	if control=controls.touch
	{
		if mouse_check_button_released(mb_any)
		{
			trigger_spawn=true;
		}
	}
}