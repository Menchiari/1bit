//surface_resize(application_surface,room_width,room_height);
surface_resize(application_surface,global.res_x,global.res_y);

instance_create_depth(x,y,-y,obj_fx_fadein);
//if instance_exists(obj_hero)
//{
//	if instance_exists(obj_player_spawn) && instance_exists(obj_hero) && !instance_exists(obj_asset_bonfire)
//	{
//		obj_hero.x=obj_player_spawn.x;
//		obj_hero.y=obj_player_spawn.y;
//	}
//}