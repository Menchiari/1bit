if instance_exists(char)
{
	switch trigger_type
	//different trigger types for different dialogue types: example enemies or npc etc
	{
		case 0:
		//enemy guarding dialogue within range, destroyed if hero gets close
			if instance_exists(obj_hero)
			{
				if point_distance(char.x,char.y,obj_hero.x,obj_hero.y)<trigger_distance
				&& scr_in_view(char.x,char.y,50,0)
				{
					if point_distance(char.x,char.y,obj_hero.x,obj_hero.y)>trigger_distance_near
					{
						char.speech_text=trigger_text;
						char.speech_visible=true;
						char.speech_distance=trigger_distance;
						char.state=states.idle;
						char.ai_state=ai_states.idle;
						scr_ai_lookat(obj_hero.x,obj_hero.y,char);
					}
					else
					{
						char.speech_text="";
						char.ai_state=char.ai_state_original;
						instance_destroy();
					}
				}
				else
				{
					char.speech_text="";
					char.ai_state=char.ai_state_original;
				}
			}
		break;
	}
	
	x=char.x;
	y=char.y;
	if char.state=states.death {instance_destroy();}

}
//if the character is not assigned
else
{
	char=collision_circle(x,y,32,obj_character,true,true);
}