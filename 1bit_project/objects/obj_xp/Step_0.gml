/// @description 
if instance_exists(obj_hero)
{
	if speed>0 {speed-=.1;}
	if speed<0 {speed+=.1;}
	if point_distance(x,y,obj_hero.x,obj_hero.y)<=range
	{
		move_towards_point(obj_hero.x,obj_hero.y,point_distance(x,y,obj_hero.x,obj_hero.y)/20);
		if point_distance(x,y,obj_hero.x,obj_hero.y)<10
		{
			global.xp+=xp_value;
			instance_destroy();
		}
	}
}