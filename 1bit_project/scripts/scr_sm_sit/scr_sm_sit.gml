function scr_sm_sit(){
	x=round(x);
	y=round(y);
	speed=0;
	
	scr_animation_reverse(trigger_spawn_idle_b,trigger_spawn_idle_a,-idle_speed);
	
	if control==controls.touch
	{
		if mouse_check_button_released(mb_any)
		{
			image_speed=idle_speed;
			image_index=trigger_spawn_idle_a;
			state=states.spawn;
		}
	}
}