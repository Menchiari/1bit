function scr_sm_sit(){
	speed=0;
	path_end();
	
	scr_animation_reverse(trigger_spawn_a,trigger_spawn_b,idle_speed);
	
	if control==controls.touch
	{
		dest_x=x;
		dest_y=y;
		click_x=x;
		click_y=y;
		if mouse_check_button_released(mb_any)
		{
			image_speed=idle_speed;
			image_index=trigger_spawn_idle_a;
			state=states.spawn;
		}
	}
}