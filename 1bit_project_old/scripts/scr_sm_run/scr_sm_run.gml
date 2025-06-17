function scr_sm_run(){
	scr_animation_loop(run_a,run_b);
	image_speed=random_range(.2,.5)*spd*defence_speed;
	scr_footsteps(run_a,(abs(run_a-run_b)/2)+1,1);
	speed=run_sp*spd*defence_speed;
	blocking=false;
	
//movement
	#region old stuff
	//move_towards_point(dest_x,dest_y,run_sp);
	//if collision_circle(x,y,20,obj_collider,true,true)
	//{
	//	if mp_potential_path(path,dest_x,dest_y,run_sp*spd*defence_speed,4,false)
	//	&& path_get_length(path)<1000
	//	{path_start(path,run_sp*spd*defence_speed,0,0);}
	//	else {state=states.idle;}
	//}
	//else
	//{
	//	if !mp_potential_step_object(dest_x,dest_y,run_sp*spd*defence_speed,obj_collider) {mp_potential_step_object(dest_x,dest_y,run_sp*spd*defence_speed,obj_collider);}
	//	else {state=states.idle;}
	//}
	////mp_potential_step(dest_x,dest_y,run_sp,false);
	//if point_distance(x,y,dest_x,dest_y)<run_sp
	//|| collision_circle(x+lengthdir_x(player_radius*2,direction),y+lengthdir_y(player_radius*2,direction),player_radius,obj_collider,true,true)
	//{state=states.idle;}
	#endregion
	
	#region attempt 2
	//if mp_linear_step(dest_x,dest_y,speed,false)
	//|| collision_circle(x+lengthdir_x(player_radius*2,direction),y+lengthdir_y(player_radius*2,direction),player_radius,obj_collider,true,true)
	//{state=states.idle;}
	#endregion
	
	scr_character_move(dest_x,dest_y,run_sp,3);

//controls
	if control=controls.touch
	{
		if mouse_pressed==true
		{
			click_x=mouse_x;click_y=mouse_y;
			scr_flip_check_mouse(dest_x,dest_y,1)
			state=states.block;
		}
	}	
}