function scr_ai_target_check(){
//check target
	
	//var xcheck=x+random_range(ai_search_range/5*dir,ai_search_range*dir);
	//var ycheck=y+random_range(0,ai_search_range);
	//if back==true ycheck=y-random_range(0,ai_search_range);
	//var temp_target=collision_line(x,y,xcheck,ycheck,obj_character,false,true);	
	
	var xcheck=ai_search_range*dir;
	var ycheck=ai_search_range;
	if back==true {ycheck=-ai_search_range;}
	
	var temp_target=collision_rectangle(x-xcheck/2,y-ycheck,x+xcheck,y+ycheck,obj_character,false,true); //collision_line(x,y,xcheck,ycheck,obj_character,false,true);	
	if instance_exists(temp_target)
	{
		if scr_faction_check_ai(temp_target)==true
		//&& !collision_line(x,y,xcheck,ycheck,obj_collider,true,true)
		&& !collision_line(x,y,temp_target.x,temp_target.y,obj_collider,true,true)
		{
			speech_text="!"
			//if point_distance(x,y,temp_target.x,temp_target.y)<ai_search_range
			//{
				ai_target=temp_target;
				ai_target_x=temp_target.x;
				ai_target_y=temp_target.y;
				ai_state=ai_states.alert;
			//}
		}
	}
	//repeat(2)
	//{
	//	var xcheck=x+random_range(ai_search_range,-ai_search_range);
	//	var ycheck=y+random_range(ai_search_range,-ai_search_range);
	//	var temp_target=collision_line(x,y,xcheck,ycheck,obj_character,true,true);	
		
	//	if instance_exists(temp_target)
	//	{
	//		if scr_faction_check_ai(temp_target)==true
	//		&& !collision_line(x,y,xcheck,ycheck,obj_collider,true,true)
	//		{
	//			if point_distance(x,y,temp_target.x,temp_target.y)<ai_search_range
	//			{
	//				ai_target=temp_target;
	//				ai_target_x=temp_target.x;
	//				ai_target_y=temp_target.y;
	//				ai_state=ai_states.alert;
	//			}
	//		}
	//	}
	//}
}
