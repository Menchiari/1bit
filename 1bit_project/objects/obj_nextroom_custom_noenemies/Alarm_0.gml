/// @description delayed step event
alarm[0]=10;
if place_meeting(x,y,obj_hero) && once==true && !collision_circle(x,y,150,obj_enemy,false,true)
{
	alarm[1]=wait_time;
	once=false;
	var fade=instance_create(obj_fx_fadeout);
	fade.fade_speed=fade_time;//.03
}