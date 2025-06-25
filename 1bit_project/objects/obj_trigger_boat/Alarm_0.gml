if instance_exists(obj_hero)
{
	obj_hero.x=boat_location_x+random_range(-2,+2);
	obj_hero.y=boat_location_y;
	obj_hero.dir=choose(-1,1);
	obj_hero.state=states.sit;
	obj_hero.control=controls.null;
	alarm[1]=20;
}