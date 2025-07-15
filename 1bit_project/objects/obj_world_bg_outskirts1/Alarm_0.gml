/// @description spawns foreground sprite
if foreground!=spr_null
{
	var fginst=instance_create_layer(x,y,"Foregrounds",obj_world_bg);
	fginst.sprite_index=foreground;
}