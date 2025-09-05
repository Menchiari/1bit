/// @description
if instance_exists(obj_hero)
{
	if point_distance(x,y,obj_hero.x,obj_hero.y)<distancez{instance_destroy();}
	if obj_hero.state=states.sit_idle
	|| obj_hero.state=states.spawn
	|| obj_hero.state=states.sit
	{
		textz="tap once\nto stand"
	}
	else
	{
		textz=text_v;
	}
}

if mouse_check_button(mb_any){colorz=c_white;}
else {colorz=c_red;}