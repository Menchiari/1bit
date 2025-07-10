/// @description
if instance_exists(obj_hero)
{
	if point_distance(x,y,obj_hero.x,obj_hero.y)<activation_range && once==true
	{
		alarm[0]=1;
		once=false;
	}
}