/// @description movement
if x<-sprite_get_width(sprite_index)+180
{
	if instance_exists(obj_hero)
	{
		obj_hero.control=global.player_control
	}
}
else
{
	x-=camspeed;
}