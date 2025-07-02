/// @description room start teleport player

if !instance_exists(obj_asset_bonfire) && instance_exists(obj_player_spawn)
{
	x=obj_player_spawn.x;
	y=obj_player_spawn.y;
	dest_x=obj_player_spawn.x;
	dest_y=obj_player_spawn.y;
}