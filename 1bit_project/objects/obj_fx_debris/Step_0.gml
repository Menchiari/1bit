if spd>=0
{
	x+=spd*dirx;
	y+=spd*diry;
	spd-=speed_friction;
	
	if place_meeting(x,y,obj_collider)
	{
		dirx=-dirx;
		diry=-diry;
	}
	
	if collision_point(x,y,obj_trigger_deathfall,true,true)
	{
		instance_destroy();
	}
	
	depth=-y+(sprite_height/2);
}