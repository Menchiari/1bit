// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_main(){
	if speech_verbose==true 
	{	
		speech_visible=true;
		speech_distance=1000;
	}
	speech_text="";
	var dist=10;

	if state!=states.spawn
	{
		switch ai_state
		{
			#region IDLE
				case ai_states.idle:
					if speech_verbose==true speech_text=string(name);
					walk_sp_mod=1;
					state=states.idle;				
					scr_ai_target_check();
				break;
			#endregion
			#region WANDER
				case ai_states.wander:
					if speech_verbose==true speech_text="wander";
					//var dist=10
					//if point_distance(x,y,dest_x,dest_y)>=dist {state=states.walk;}
					//else {state=states.idle;}
					state=states.walk;
				
					if point_distance(x,y,dest_x,dest_y)<=dist || collision_line(x,y,dest_x,dest_y,obj_collider,true,true)
					{
						walk_sp_mod=.3;
						dest_x=x+random_range(run_distance_min*4,-run_distance_min*4);
						dest_y=y+random_range(run_distance_min*4,-run_distance_min*4);
					}
					scr_ai_target_check();
				break;
			#endregion
			#region FOLLOW
				case ai_states.follow:
					if speech_verbose==true speech_text="following"
					walk_sp_mod=1.1;
					if point_distance(x,y,dest_x,dest_y)>walk_sp*2 {state=states.walk;}
					else {state=states.idle;}
				
					if instance_exists(ai_follow_target)
					{
						if point_distance(x,y,ai_follow_target.x,ai_follow_target.y)>ai_search_range && !collision_line(x,y,ai_follow_target.x,ai_follow_target.y,obj_collider,true,true) {dest_x=ai_follow_target.x; dest_y=ai_follow_target.y;}
						//else {dest_x=x;dest_y=y;}
					}
					else
					{
						state=states.idle;
					}
					scr_ai_target_check();
				break;
			#endregion
			#region GUARD
				case ai_states.guard:
					if speech_verbose==true speech_text="guarding";
				//	if point_distance(x,y,dest_x,dest_y)>walk_sp*2 {state=states.walk;}
				//	else {state=states.idle;}
				
				//	scr_ai_target_check();
				//	if instance_exists(ai_target)
				//	{if point_distance(x,y,ai_target.x,ai_target.y)>ai_search_range {dest_x=ai_guard_x;dest_y=ai_guard_y;}}
				//	else
				//	{if point_distance(x,y,ai_guard_x,ai_guard_y)>50 {dest_x=ai_guard_x;dest_y=ai_guard_y;} else {dest_x=x;dest_y=y;}}
					//var dist=10;
					var walk_chance=irandom_range(0,100);
				
					if walk_chance<2 {ai_trigger_check=!ai_trigger_check;}
					if ai_trigger_check==true
					{
						state=states.walk;
				
						if point_distance(x,y,dest_x,dest_y)<=dist
						{
							walk_sp_mod=.3;
							dest_x=x+random_range(run_distance_min*4,-run_distance_min*4);
							dest_y=y+random_range(run_distance_min*4,-run_distance_min*4);
						}
						if point_distance(x,y,ai_guard_x,ai_guard_y)>=dist
						{
							walk_sp_mod=.5;
							dest_x=ai_guard_x;
							dest_y=ai_guard_y;
						}
					}
					else
					{
						state=states.idle;
					}
					scr_ai_target_check();
				break;
			#endregion
			#region PATROL
				case ai_states.patrol:
					if speech_verbose==true speech_text="patrolling";
					walk_sp_mod=.3;
					if point_distance(x,y,dest_x,dest_y)>walk_sp*2 {state=states.walk;}
					else {state=states.idle;}
				
					if point_distance(x,y,ai_guard_x,ai_guard_y)<10 {dest_x=ai_patrol_x;dest_y=ai_patrol_y;}
					if point_distance(x,y,ai_patrol_x,ai_patrol_y)<10 {dest_x=ai_guard_x;dest_y=ai_guard_y;}
					scr_ai_target_check();
				break;
			#endregion
			#region ALERT
				case ai_states.alert:
					if speech_verbose==true speech_text="!";
					
					var alert_distance=ai_search_range;
					if point_distance(x,y,dest_x,dest_y)>20{dest_x=x;dest_y=y;}
					if random_range(0,100)<ai_responsiveness// {ai_state=ai_states.search;}
					{
						if instance_exists(ai_target)
						{
							if point_distance(x,y,ai_target.x,ai_target.y)<alert_distance
							{
								ai_target_x=ai_target.x;
								ai_target_y=ai_target.y;
								ai_state=ai_states.search;
							}
						}
					}
					else if irandom_range(0,100)>=100-ai_responsiveness {ai_state=ai_state_original;}
				break;
			#endregion
			#region CHASE
				case ai_states.chase:
					if speech_verbose==true speech_text="come here!";
					state=states.run;
					var chase_distance=ai_search_range*2;
					var attack_distance=ai_search_range/2;
				
					if instance_exists(ai_target)
					{
						if point_distance(x,y,ai_target.x,ai_target.y)<chase_distance {dest_x=ai_target.x;dest_y=ai_target.y;}
						if point_distance(x,y,ai_target.x,ai_target.y)<attack_distance {ai_state=ai_states.fight;}
						if point_distance(x,y,ai_target.x,ai_target.y)>chase_distance {/*ai_target_x=ai_target.x; ai_target_y=ai_target.y;*/ ai_state=ai_states.search;}
					}
					else {ai_state=ai_state_original;}
				break;
			#endregion
			#region SEARCH
				case ai_states.search:
					if speech_verbose==true speech_text="?";
					walk_sp_mod=1.3;
					if point_distance(x,y,dest_x,dest_y)>walk_sp*2 {state=states.walk;}
					else
					{
						state=states.idle;
						var chance=random_range(0,100);
						if chance<=ai_responsiveness {ai_state=ai_state_original;}
					}
					scr_ai_target_check();
					if instance_exists(ai_target)
					{
						var search_distance=ai_search_range*1.5;
						dest_x=ai_target_x;
						dest_y=ai_target_y;
						//var chance=random_range(0,100);
						if /*chance<=ai_responsiveness &&*/ point_distance(x,y,ai_target_x,ai_target_y)<search_distance {ai_state=ai_states.chase;}
					}
					else {ai_state=ai_state_original;}
				break;
			#endregion
			#region FIGHT
				case ai_states.fight:
					if speech_verbose==true speech_text="DIE!!!";
					if instance_exists(ai_target)
					{
						if speech_verbose==true speech_text="fighting "+string(ai_target.name);
						if point_distance(x,y,ai_target.x,ai_target.y)<ai_search_range/2
						&& !collision_line(x,y,ai_target.x,ai_target.y,obj_collider,true,true)
						{
							scr_ai_fight();
						}
						else
						{
							ai_state=ai_states.search;
						}
					}
					else {ai_state=ai_state_original;}
				break;
			#endregion
			#region FLEE
				case ai_states.flee:
					speech_text="help!";
					var dist=20
					state=states.run;
					if point_distance(x,y,dest_x,dest_y)<=dist || collision_line(x,y,dest_x,dest_y,obj_collider,true,true)
					{
						dest_x=x+random_range(run_distance_min*4,-run_distance_min*4);
						dest_y=y+random_range(run_distance_min*4,-run_distance_min*4);
					}
					var chance=irandom_range(0,100);
					if chance<.5 ai_state=ai_state_original;
				break;
			#endregion
			
				case ai_states.null:
					speech_text="wtf"
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
		#region RESET CASES
		if instance_exists(ai_target)
		{
			if collision_line(x,y,ai_target.x,ai_target.y,obj_collider,true,true)
			{
				var reset_chance=0;
				if irandom_range(1,100)<reset_chance {ai_state=ai_state_original;}
			}
		}
		#endregion
	}
	if dest_x < x {dir=1};
	else {dir=-1};
	if dest_y < y-6 {back=true};
	else {back=false};
}