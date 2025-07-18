depth=global.depth_ui;

if instance_exists(obj_hero)
{
	if point_distance(obj_hero.x,obj_hero.y,xoriginal,yoriginal)<active_range
	{
		var othershop=collision_circle(x,y,active_range,obj_ui_shop,true,true)
		if othershop==true
		{
			if point_distance(xoriginal,yoriginal,obj_hero.x,obj_hero.y)<point_distance(othershop.x,othershop.y,obj_hero.x,obj_hero.y) {active=1;}
			else {active=0;}
		}
		else {active=1;}
	}
	else {active=0;}
}

if collision_circle(xoriginal,yoriginal,reactive_range,obj_enemy,false,true) {active=0;}

if active==1
{
	if mouse_check_button_released(mb_any) && point_in_circle(mouse_x,mouse_y,x,y,radius) && instance_exists(obj_hero)
	{
		instance_create_depth(obj_hero.x,obj_hero.y,obj_hero.depth,obj_torch);
		instance_destroy();
	}
}