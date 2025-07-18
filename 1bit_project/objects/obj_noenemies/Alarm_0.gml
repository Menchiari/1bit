/// @description
if instance_exists(obj_asset_bonfire)
{
	with(obj_asset_bonfire){instance_destroy();}
	alarm[0]=1;
}
//if instance_exists(obj_enemy){instance_destroy(obj_enemy);alarm[0]=1;}
//if instance_exists(obj_character_spawn){instance_destroy(obj_character_spawn);alarm[0]=1;}
//if instance_exists(obj_ally_start_var){instance_destroy(obj_ally_start_var);alarm[0]=1;}
layer_destroy_instances("char_other");
layer_destroy_instances("char_spawn");