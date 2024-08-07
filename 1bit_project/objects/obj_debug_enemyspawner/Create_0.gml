xpos=x;
ypos=y;

repeat(choose(irandom_range(1,3),irandom_range(4,6),irandom_range(10,20)))
{
	xpos=random_range(0,room_width);
	ypos=random_range(0,room_height);

	if collision_circle(xpos,ypos,20,obj_collider,true,true)
	{
		do {xpos=random_range(0,room_width);ypos=random_range(0,room_height);}
		until !collision_circle(xpos,ypos,20,obj_collider,true,true)
	}

	instance_create_depth(xpos,ypos,-y,obj_enemy);
}