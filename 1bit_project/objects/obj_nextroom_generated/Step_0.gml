if place_meeting(x,y,obj_hero) && once==true
{
	alarm[0]=wait_time;
	once=false;
	instance_create(obj_fx_fadeout);
}