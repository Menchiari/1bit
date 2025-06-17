function scr_sm_roll(){
	scr_animation(jump_a,jump_b);
	image_speed=.5*spd*defence_speed;
	scr_footsteps(jump_b-5,jump_b-3,1.5);
	blocking=false;

	
	if image_index==jump_a
	{
		path_end();
		var move_speed=roll_sp*(spd*defence_speed)*.75;
		move_towards_point(dest_x,dest_y,move_speed);
		if x<dest_x {dir=-1;}
		else {dir=1;}
	}
	
//movement
	if speed>0 {speed-=roll_sp_decrease*(spd*defence_speed);}
	if image_index>=jump_b-1 {state=states.idle;}
	scr_attack_system(abs(jump_a-jump_b/2),10,0,0,1,atk_push_speed_divider);
	if image_index>jump_a-1 && image_index<jump_b-3 {invincible=true;}
	else {invincible=false;}
	
//controls
	if control=controls.touch
	{
		//scr_flip_check_mouse(x-(click_x-dest_x),y-(click_y-dest_y),1);
	}
}