/// @description
if instance_exists(obj_hero){
	if point_distance(x,y,obj_hero.x,obj_hero.y)<320
	{
		repeat(amount_var)
		{
			instance_create_depth(x+random_range(range_var_x*-1,range_var_x),y+random_range(range_var_y*-1,range_var_y),-y,obj_bird);
		}
		instance_destroy();
	}
}