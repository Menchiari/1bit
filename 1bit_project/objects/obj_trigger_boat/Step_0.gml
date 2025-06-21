if place_meeting(x,y,obj_hero) && once==true
{
	obj_hero.dest_x=boat_location_x;
	obj_hero.dest_y=boat_location_y;
	alarm[0]=10;
	once=false;
}