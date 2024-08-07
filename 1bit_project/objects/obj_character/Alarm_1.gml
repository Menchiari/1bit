/// @description collision detection
alarm[1]=collision_check_time;
if !collision_circle(x,y,5,obj_collider,true,true)
{
	collision_check_x=x;
	collision_check_y=y;
	collision_check=false;
}
else
{
	collision_check=true;
}