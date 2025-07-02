/// @description teleport
room_goto(nextroom);
if coordinates==true
{obj_hero.x=teleport_x;obj_hero.y=teleport_y;}
once=true;
if instance_exists(obj_fx_fadeout)
{
	instance_destroy(obj_fx_fadeout);
}