function scr_ai_zombie(idle_actions){
	var atk_distance=attack_range_strong+(atk2_sp*4);
//when close to hero
	if instance_exists(obj_hero)
	{
		if point_distance(x,y,obj_hero.x,obj_hero.y)<atk_distance
		&& (state==states.idle
		|| state==states.walk)
		{
		//block or attack
			var chance=random_range(0,100);
			if chance<ai_responsiveness
			{
				ai_timer_attack=random_range(ai_timer_attack1,ai_timer_attack2*2);
				image_index=0;
				state=states.block;
			}
		}
	}
//When in Idle
	if state=states.idle
	{
		var chance=random_range(0,100);
		if chance<ai_responsiveness
		{
			scr_ai_actions(idle_actions);
		}
	}
//Preparing to attack
	if state=states.block
	{
	//ai_test attack
		if timer>ai_timer_attack
		{
		//do action defined in block
			image_index=0;
				
			if timer>atk2_time
			{
				state=states.attack_strong;
			}
			else if timer>atk1_time
			{
				state=states.attack;
			}
			else
			{
				state=states.roll;
			}
		//move towards hero
			if instance_exists(obj_hero)
			{
				dest_x=obj_hero.x;
				dest_y=obj_hero.y;
				//move_towards_point(obj_hero.x,obj_hero.y,move_speed);
			}
			else
			{
				state=states.idle;
			}
		}
	}
}