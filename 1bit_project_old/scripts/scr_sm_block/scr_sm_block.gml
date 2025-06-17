function scr_sm_block(){
	timer+=1;
//movement and animation
	if abs(speed)>1 {speed-=block_sp_decrease;}
	else{speed=0;path_end();}
	
	if timer>atk2_time
	{
		scr_animation(attack_charge_strong,attack_charge_strong);
		blocking=false;
	}
	else if timer>atk1_time
	{
		scr_animation(attack_charge,attack_charge);
		blocking=false;
	}
	else
	{
		scr_animation(block_a,block_b);
		blocking=true;
	}
	
//controls
	scr_block_controls();
}