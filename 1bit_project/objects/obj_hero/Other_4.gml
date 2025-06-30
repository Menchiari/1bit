/// @description

// Inherit the parent event
event_inherited();

if !instance_exists(obj_asset_bonfire) && instance_exists(obj_player_spawn)
{
	x=obj_player_spawn.x;
	y=obj_player_spawn.y;
	dest_x=x;
	dest_y=y;
}