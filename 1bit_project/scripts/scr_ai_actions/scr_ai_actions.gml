function scr_ai_actions(action_choice){
	var ai_walk_radius=50;
	var ai_run_radius=150;
switch action_choice
{
	case 0: //WALK
		dest_x=x+random_range(-ai_walk_radius,ai_walk_radius);
		dest_y=y+random_range(-ai_walk_radius,ai_walk_radius);
		if collision_circle(dest_x,dest_y,10,obj_collider,true,true)
		|| collision_circle(dest_x,dest_y,1,obj_character,true,true)
		|| collision_circle(dest_x,dest_y,20,obj_avoid,true,true)
		{dest_x=x;dest_y=y;}
		state=states.walk;
	break;
	case 1: //RUN
		dest_x=x+random_range(-ai_run_radius,ai_run_radius);
		dest_y=y+random_range(-ai_run_radius,ai_run_radius);
		if collision_circle(dest_x,dest_y,10,obj_collider,true,true)
		|| collision_circle(dest_x,dest_y,1,obj_character,true,true)
		|| collision_circle(dest_x,dest_y,20,obj_avoid,true,true)
		{dest_x=x;dest_y=y;}
		state=states.run;
	break;
	case 2: //WALK TO CHAR
		if instance_exists(ai_target)
		{
			dest_x=ai_target.x+(choose(-30,30));
			dest_y=ai_target.y+(choose(-30,30));
		}
		else
		{
			dest_x=x+random_range(-ai_walk_radius,ai_walk_radius);
			dest_y=y+random_range(-ai_walk_radius,ai_walk_radius);
		}
		state=states.walk;					
	break;
	case 3: //RUN TO CHAR
		if instance_exists(ai_target)
		{
			dest_x=ai_target.x+(choose(15,-15));
			dest_y=ai_target.y+(choose(15,-15));
		}
		else
		{
			dest_x=x+random_range(-ai_run_radius,ai_run_radius);
			dest_y=y+random_range(-ai_run_radius,ai_run_radius);
		}
		state=states.run;				
	break;
	case 4: //BLOCK
		ai_timer_attack=random_range(ai_timer_attack1,ai_timer_attack2*2);
		image_index=0;
		state=states.block;
	break;
	default:
	break;
}
}