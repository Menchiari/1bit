if only_once==true
{
	if place_meeting(x,y,obj_hero) && once==true
	{
		obj_hero.x=destination_x;
		obj_hero.y=destination_y;
		obj_hero.dest_x=destination_x;
		obj_hero.dest_y=destination_y;
		once=false;
	}
}
else
{
	if place_meeting(x,y,obj_hero)
	{
		obj_hero.x=destination_x;
		obj_hero.y=destination_y;
		obj_hero.dest_x=destination_x;
		obj_hero.dest_y=destination_y;
	}
}