function scr_ai_main_new(){

//ai_state_original
//ai_states.
//scr_ai_fight();

	if speech_verbose==true
	{	
		speech_visible=true;
		speech_distance=1000;
	}
	//speech_text="";
	var dist=10;

	if state!=states.spawn
	{
		switch ai_state
		{
			#region IDLE
				case ai_states.idle:
					if speech_verbose==true speech_text=string(name);
					scr_ai_target_check();
				break;
			#endregion
			#region WANDER
				case ai_states.wander:
					if speech_verbose==true speech_text="wander";
					scr_ai_target_check();
				break;
			#endregion
			#region FOLLOW
				case ai_states.follow:
					if speech_verbose==true speech_text="following"
					scr_ai_target_check();
				break;
			#endregion
			#region GUARD
				case ai_states.guard:
					if speech_verbose==true speech_text="guarding";
					scr_ai_target_check();
				break;
			#endregion
			#region PATROL
				case ai_states.patrol:
					if speech_verbose==true speech_text="patrolling";
					scr_ai_target_check();
				break;
			#endregion
			#region ALERT
				case ai_states.alert:
					if speech_verbose==true speech_text="alert!";
					var randomness=random_range(0,100);
					if randomness<ai_responsiveness {}
				break;
			#endregion
			#region AWARE
				case ai_states.aware:
					if speech_verbose==true speech_text="alert!";
					var randomness=random_range(0,100);
					if randomness<ai_responsiveness {}
				break;
			#endregion
			#region CHASE
				case ai_states.chase:
					if speech_verbose==true speech_text="come here!";
				break;
			#endregion
			#region SEARCH
				case ai_states.search:
					if speech_verbose==true speech_text="where?";
				break;
			#endregion
			#region FIGHT
				case ai_states.fight:
					if speech_verbose==true speech_text="fighting!";
				break;
			#endregion
			#region FLEE
				case ai_states.flee:
					speech_text="help!";
				break;
			#endregion
				case ai_states.null:
					speech_text="..."
					ai_state=ai_state_original;//speech_text="";
				break;
				default:
					ai_state=ai_states.idle;
				break;
		}
		#region FLEEING CASES
		if instance_exists(ai_target)
		{
			var flee_chance=((ai_target.hp_max/hp_max)+abs(ai_target.charisma/charisma))/80;
	
			if random_range(0,100)<flee_chance && (state=states.hit || state=states.block_hit)
			{
				if hp<ai_target.hp/10 {ai_state=ai_states.flee;}
			}
		}
		#endregion
	}
	if dest_x < x {dir=1}
	else {dir=-1};
	if dest_y < y-6 {back=true}
	else {back=false};
	//if speed<=.5 {state=states.idle;}
}