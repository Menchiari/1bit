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
				
					if point_distance(x,y,dest_x,dest_y)<=dist || collision_line(x,y,dest_x,dest_y,obj_collider,true,true)
					{
						state=states.walk;
						walk_sp_mod=.3;
						dest_x=x+random_range(run_distance_min*4,-run_distance_min*4);
						dest_y=y+random_range(run_distance_min*4,-run_distance_min*4);
					}
					else
					{state=states.idle;}
					scr_ai_target_check();
				break;
			#endregion
			#region FOLLOW
				case ai_states.follow:
					var follow_distance=30;
					if speech_verbose==true speech_text="following"
					walk_sp_mod=1.1;
					if point_distance(x,y,dest_x,dest_y)>80 {state=states.run}
					else if point_distance(x,y,dest_x,dest_y)>50 {state=states.walk;}
					else {state=states.idle;}
				
					if instance_exists(ai_follow_target)
					{
						if point_distance(x,y,ai_follow_target.x,ai_follow_target.y)>follow_distance//ai_search_range /*&& !collision_line(x,y,ai_follow_target.x,ai_follow_target.y,obj_collider,true,true)*/
						{
							var _checkfrequency=5;
							if irandom_range(0,100)<=_checkfrequency
							{
								dest_x=ai_follow_target.x+(choose(15,20,25,30,35,40)*choose(1,-1)*ai_follow_target.dir);
								dest_y=ai_follow_target.y+(choose(5,10,15)*choose(1,-1)*ai_follow_target.back);
							}
						}
						else {dest_x=x;dest_y=y;state=states.idle;}
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
				
					if walk_chance<1 {ai_trigger_check=!ai_trigger_check;}
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
						speed=0;
						state=states.idle;
						dest_x = x;
						dest_y = y;
					}
					scr_ai_target_check();
				break;
			#endregion
			#region PATROL
				case ai_states.patrol:
					if speech_verbose==true speech_text="patrolling";
					walk_sp_mod=.3;
					if point_distance(x,y,dest_x,dest_y)>walk_sp*2 {state=states.walk;}
					else {
						state=states.idle;
						dest_x = x;
						dest_y = y;
					}
				
					if point_distance(x,y,ai_guard_x,ai_guard_y)<10 {dest_x=ai_patrol_x;dest_y=ai_patrol_y;}
					if point_distance(x,y,ai_patrol_x,ai_patrol_y)<10 {dest_x=ai_guard_x;dest_y=ai_guard_y;}
					scr_ai_target_check();
				break;
			#endregion
			#region ALERT
				case ai_states.alert:
					if speech_verbose==true speech_text="halt!";
					
					var alert_distance=ai_search_range;
					if point_distance(x,y,dest_x,dest_y)>20{state=states.run; dest_x=x;dest_y=y;}
					if instance_exists(ai_target)
					{
						if point_distance(x,y,ai_target.x,ai_target.y)<alert_distance
						{
							ai_target_x=ai_target.x;
							ai_target_y=ai_target.y;
							ai_state=ai_states.search;
						}
					}
					else if irandom_range(0,100)>=100-(ai_responsiveness/4) {ai_state=ai_state_original;}
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
						if point_distance(x,y,ai_target.x,ai_target.y)>chase_distance {ai_target_x=ai_target.x; ai_target_y=ai_target.y; ai_state=ai_states.search;}
					}
					else {ai_state=ai_state_original;}
				break;
			#endregion
			#region SEARCH
				case ai_states.search:
					if speech_verbose==true speech_text="where?";
					//walks faster to destination
					walk_sp_mod=1.3;
					//if it gets close to destination stays still if not it walks
					if point_distance(x,y,dest_x,dest_y)>walk_sp*walk_sp_mod*2 {state=states.walk;}
					else {state=states.idle;}
					//checks target and decides what to do with responsiveness
					scr_ai_target_check();
					if instance_exists(ai_target)
					{
						var search_distance=ai_search_range*1.5;
						dest_x=ai_target_x;
						dest_y=ai_target_y;
						var chance=random_range(0,100);
						if chance<=ai_responsiveness*4 && point_distance(x,y,ai_target_x,ai_target_y)<search_distance {ai_state=ai_states.chase;}
					}
					else
					{
						var chance=random_range(0,100);
						if chance<=ai_responsiveness/5
						{
							var _choose=choose(0,1,1);
							if choose==0 {ai_state=ai_state_original;}
							if choose==1 {dest_x=x+random_range(-50,50); dest_y=y+random_range(-50,50);}
						}
					}
				break;
			#endregion
			#region FIGHT
				case ai_states.fight:
					if speech_verbose==true speech_text="DIE!!!";
					if instance_exists(ai_target)
					{
						var _searchdistance=ai_search_range/2;
						if weapon.bullets>0 {_searchdistance=120;}
						if speech_verbose==true speech_text="fighting "+string(ai_target.name);
						if point_distance(x,y,ai_target.x,ai_target.y)<_searchdistance
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
					var flee_distance=40
					state=states.run;
					if point_distance(x,y,dest_x,dest_y)<=flee_distance || collision_line(x,y,dest_x,dest_y,obj_collider,true,true)
					{
						dest_x=x+random_range(run_distance_min*4,-run_distance_min*4);
						dest_y=y+random_range(run_distance_min*5,-run_distance_min*5);
					}
					var chance=random_range(0,100);
					if chance<.5+(abs(charisma)/10) ai_state=ai_state_original;
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
		//#region FLEEING CASES
		//if instance_exists(ai_target)
		//{
		//	var flee_chance=((ai_target.hp/hp)-1) + ((ai_target.charisma+abs(charisma))*-1) + ((ai_target.str/str)-1) + ((ai_target.res/res)-1) //((ai_target.str/str)+abs(ai_target.res/res)+((ai_target.hp/hp)*4)-ai_target.charisma)/80;
		//	show_debug_message(string(flee_chance)+" flee chance of "+string(self.name))
		//	show_debug_message(string(flee_chance)+" flee chance of "+string(ai_target.name))
	
		//	if random_range(0,100)<flee_chance && (state=states.hit || state=states.block_hit)
		//	{
		//		//if hp<ai_target.hp/10 {ai_state=ai_states.flee;}
		//		ai_state=ai_states.flee;
		//	}
		//}
		//#endregion
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