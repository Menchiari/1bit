// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_collisions(){
//collision detection

	if !collision_circle(x,y,player_radius,obj_collider,true,true)
	{
		lastplacex=x;
		lastplacey=y;
	}
	else
	{
		direction+=180//=-direction;
		if direction>=360 {direction-=360}
		x=lastplacex; y=lastplacey;
		if state=states.hit
		|| state=states.block_hit
		|| state=states.roll
		{
			speed=speed/2;
			state=states.collide_hit;
		}
		else if state=states.attack_strong
		|| state==states.attack
		{
		//keep finishing the state if it hits the wall
			speed=speed/8;
		}
		else
		{
			//if speed<1 state=states.idle;
		}
	}
	
	//inside collision area
	if collision_point(x,y,obj_collider,true,true)
	{
		x+=player_radius*10;
		y+=player_radius*10;
	}
	
//colliding with character
	var char_collision=collision_circle(x,y,player_radius,obj_character,true,true);
	if char_collision && scr_faction_check(char_collision)
	{
		if state=states.attack
		|| state=states.attack_strong
		{
			//only attacks
			speed=speed*.5;
		}
		else if state=states.roll
		{
			//only rolling
			speed=speed*.95;
		}
		else
		{
			//all other animations
			//speed=speed*.75;
		}
	}
////colliding with deathfall
	var death_fall=collision_point(x,y,obj_trigger_deathfall,true,true)
	if death_fall && speed<run_sp
	{
		//if instance_exists(reflection) instance_destroy(reflection);
		var fall_speed=.03;
		char_rot+=random_range(1,3);
		move_towards_point(death_fall.x,death_fall.y,speed);
		if size>0 size-=fall_speed;
		if abs(size)<.5 state=states.death;
		control=controls.null;
	}

//destination not inside walls
	var check_radius=player_radius;
	if collision_circle(dest_x,dest_y,check_radius,obj_collider,true,true)
	{
		//do
		//{
			if dest_x<x {dest_x+=point_distance(x,y,dest_x,dest_y)/check_radius;}
			if dest_x>x {dest_x-=point_distance(x,y,dest_x,dest_y)/check_radius;}
			if dest_y<y {dest_y+=point_distance(x,y,dest_x,dest_y)/check_radius;}
			if dest_y>y {dest_y-=point_distance(x,y,dest_x,dest_y)/check_radius;}
			//else {dest_x+=random_range(-2,2); dest_y+=random_range(-2,2);}
		//}
		//until !collision_point(dest_x,dest_y,obj_collider,true,true);
	}
//destination not inside avoid
	if collision_circle(dest_x,dest_y,check_radius,obj_avoid,true,true)
	{
		//do
		//{
			if dest_x<x {dest_x+=point_distance(x,y,dest_x,dest_y)/check_radius;}
			else if dest_x>x {dest_x-=point_distance(x,y,dest_x,dest_y)/check_radius;}
			if dest_y<y {dest_y+=point_distance(x,y,dest_x,dest_y)/check_radius;}
			else if dest_y>y {dest_y-=point_distance(x,y,dest_x,dest_y)/check_radius;}
		//}
		//until !collision_point(dest_x,dest_y,obj_collider,true,true);
	}
}





















