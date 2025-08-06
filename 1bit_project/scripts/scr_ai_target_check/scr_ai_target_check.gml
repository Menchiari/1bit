function scr_ai_target_check(){
	#region Old Code
	/////////////////////////////check target (very old code)///////////////////////////
	//	//var xcheck=x+random_range(ai_search_range/5*dir,ai_search_range*dir);
	//	//var ycheck=y+random_range(0,ai_search_range);
	//	//if back==true ycheck=y-random_range(0,ai_search_range);
	//	//var temp_target=collision_line(x,y,xcheck,ycheck,obj_character,false,true);	
	////////////////////////////////////////////////////////////////////////////////////
	
	//var xcheck=ai_search_range*dir;
	//var ycheck=ai_search_range;
	//if weapon.bullets>0
	//{
	//	xcheck=ai_search_range*2*dir;
	//	ycheck=ai_search_range*4;
	//}
	//if back==true {ycheck=-ai_search_range;}
	
	//var temp_target=collision_rectangle(x-xcheck*dir,y-ycheck/2,x+xcheck*dir,y+ycheck/2,obj_character,false,true); //collision_line(x,y,xcheck,ycheck,obj_character,false,true);
	//if instance_exists(temp_target)
	//{
	//	if scr_faction_check_ai(temp_target)==true
	//	{
	//		if speech_verbose==true {speech_text="!O!";}
	//		if point_distance(x,y,temp_target.x,temp_target.y)<ai_search_range
	//		{
	//			ai_target=temp_target;
	//			ai_target_x=temp_target.x;
	//			ai_target_y=temp_target.y;
	//			ai_state=ai_states.alert;
	//		}
	//	}
	//}
	#endregion
	var xcheck=ai_search_range*dir;
	var ycheck=ai_search_range;
	if weapon.bullets>0 {
		xcheck=ai_search_range*2*dir;
		ycheck=ai_search_range*4;
	}
	if back==true {
		ycheck=-ai_search_range;
	}
	
	var temp_target=collision_rectangle(x-xcheck*dir,y-ycheck/2,x+xcheck*dir,y+ycheck/2,obj_character,false,true);
	if instance_exists(temp_target)
	{
		if scr_faction_check_ai(temp_target) && temp_target.hp>=0 && temp_target.state!=states.spawn && can_character_navigate(temp_target.x, temp_target.y)
		{
			if speech_verbose==true {speech_text="!O!";}
			if point_distance(x,y,temp_target.x,temp_target.y)<ai_search_range {
				ai_target=temp_target;
				ai_target_x=temp_target.x;
				ai_target_y=temp_target.y;
				ai_state=ai_states.alert;
			}
			else {ai_target=noone;}
		}
	}
	else {temp_target=noone;}
}
