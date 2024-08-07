function scr_ai_test(idle_actions){
	var atk_distance=attack_range_strong+(atk2_sp*4);
//when close to enemy
	if instance_exists(ai_target)
	{
		if point_distance(x,y,ai_target.x,ai_target.y)<atk_distance
		&& (state==states.idle
		|| state==states.walk
		|| state==states.run)
		{
		//block (or prepare attack)
			var chance=random_range(0,100);
			if chance<ai_responsiveness
			{
				ai_timer_attack=random_range(ai_timer_attack1/2,ai_timer_attack2*2);
				image_index=0;
				state=states.block;
				timer=0;
			}
		}
	}
	else{state=states.idle;ai_state=ai_state_original;}
//When in Idle
	if state==states.idle
	{
		var chance=random_range(0,100);
		if chance<ai_responsiveness{scr_ai_actions(idle_actions);}
	}
//Preparing to attack
	else if state==states.block
	{
		if timer>=ai_timer_attack
		{
	//do action defined in block
			image_index=0;
			if timer>atk1_time{state=states.attack;}
			if timer>atk2_time{state=states.attack_strong;}
			if timer<=atk1_time{state=states.roll;}
	//move towards target
			if instance_exists(ai_target) && scr_faction_check_ai(ai_target) {dest_x=ai_target.x;dest_y=ai_target.y;}
			else{state=states.idle;ai_state=ai_state_original;}
		}
	}
}