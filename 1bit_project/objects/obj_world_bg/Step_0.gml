/// @description only render when in place
if instance_exists(obj_hero)
{
	if point_distance(x+sprite_width/2,y+sprite_height/2,obj_hero.x,obj_hero.y)<active_distance {active=true}
	else {active=false}
}
