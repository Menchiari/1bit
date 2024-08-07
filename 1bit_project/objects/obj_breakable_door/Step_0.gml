/// @description 
// Inherit the parent event
event_inherited();

if instance_exists(obj_enemy)
{
	if autobreak==true
	{
		//check if enemy is in the area and destroy door if no enemies are around (with autobreak variable true)
		if instance_exists(obj_camera)
		{
			if !collision_rectangle(obj_camera.x-global.res_x/2,obj_camera.y-global.res_y/2,obj_camera.x+global.res_x/2,obj_camera.y-global.res_y/2,obj_enemy,true,true)
			{
				state=states.death;
			}
		}
		else //if there is no camera find radius based on autobreak_range
		{
			if !collision_circle(x,y,autobreak_range,obj_enemy,true,true)
			{
				state=states.death;//if hp>.5 hp=.5;
			}
		}
	}
}
//else
//{
//	if collision_circle(x,y,20,obj_hero,true,true)
//	{
//		state=states.death;
//	}
//}