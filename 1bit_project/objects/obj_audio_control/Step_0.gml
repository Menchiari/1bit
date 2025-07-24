/// @description
if instance_exists(obj_hero)
{
	audio_listener_position(obj_hero.x,obj_hero.y,0);
	audio_listener_orientation(0, 0, -1, 0, 1, 0); // forward facing into screen
}