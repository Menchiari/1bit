function scr_sm_sit(){
	speed=0;
	path_end();
	
//	scr_animation_reverse(trigger_spawn_a,trigger_spawn_b,idle_speed);
	image_speed=-idle_speed;
	if image_index>trigger_spawn_b+1 || image_index<trigger_spawn_a-1 image_index=trigger_spawn_b
	if image_index<=trigger_spawn_a && image_index>=trigger_spawn_a-1 {state=states.sit_idle;}//image_index=trigger_spawn_a
	
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
	if instance_exists(obj_asset_bonfire)
	{
		if point_distance(x,y,obj_asset_bonfire.x,obj_asset_bonfire.y)<80 {hp=hp_max;}
	}
}
function scr_sm_sit_idle(){
	image_speed=idle_speed;
	scr_animation_loop(sit_idle_a,sit_idle_b)
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