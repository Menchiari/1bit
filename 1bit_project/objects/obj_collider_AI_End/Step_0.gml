/// @description
if place_meeting(x,y,obj_hero) && once==true
{
	once=false;
	obj_hero.dest_x=270;
	obj_hero.dest_y=400;
	obj_hero.control=controls.null;
	alarm[0]=50;
}