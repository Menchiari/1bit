function scr_ai_target_check(){
//check target
	repeat(5)
	{
		var xcheck=x+random_range(ai_search_range,-ai_search_range);
		var ycheck=y+random_range(ai_search_range,-ai_search_range);
		var temp_target=collision_line(x,y,xcheck,ycheck,obj_character,true,true);	
		
		if instance_exists(temp_target)
		{
			if scr_faction_check_ai(temp_target)==true
			&& !collision_line(x,y,xcheck,ycheck,obj_collider,true,true)
			{
				if point_distance(x,y,temp_target.x,temp_target.y)<ai_search_range
				{
					ai_target=temp_target;
					ai_target_x=temp_target.x;
					ai_target_y=temp_target.y;
					ai_state=ai_states.alert;
				}
			}
		}
	}
}
