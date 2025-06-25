/// @description movement
if x<-sprite_get_width(sprite_index)+room_width
{
	if instance_exists(obj_hero) && oncerot==true
	{
		oncerot=false;
		obj_hero.control=global.player_control
		var layer_id = layer_get_id("nextroomLayer");
		layer_set_is_drawn(layer_id, true);   // turns off drawing
		layer_set_is_updated(layer_id, true); // turns off Step events (freezes logic)
	}
}
else
{
	x-=camspeed;
}