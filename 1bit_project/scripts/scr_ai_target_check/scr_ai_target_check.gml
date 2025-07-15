function scr_ai_target_check(){
//check target
	
	var xcheck=ai_search_range*1.5;
	var ycheck=ai_search_range;
	if back==true {ycheck=-ai_search_range;}
	
	var temp_target=collision_rectangle(x-xcheck,y-ycheck,x+xcheck,y+ycheck,obj_character,false,true); //collision_line(x,y,xcheck,ycheck,obj_character,false,true);	
	if instance_exists(temp_target)
	{
		if scr_faction_check_ai(temp_target)==true
		&& !collision_line(x,y,temp_target.x,temp_target.y,obj_collider,true,true)
		{
			ai_target=temp_target;
			ai_target_x=temp_target.x;
			ai_target_y=temp_target.y;
			ai_state=ai_states.alert;
		}
		//else ai_target=obj_null;
	}
}
