if instance_exists(obj_asset_bonfire)
{
	ini_open("save.sav");
	//if ini_read_real("DEBUG","PLAYERSPAWN_X_"+string(room_get_name(room)),x) !=x {x=ini_read_real("DEBUG","PLAYERSPAWN_X_"+string(room_get_name(room)),x);}
	//if ini_read_real("DEBUG","PLAYERSPAWN_Y_"+string(room_get_name(room)),y) !=y {y=ini_read_real("DEBUG","PLAYERSPAWN_Y_"+string(room_get_name(room)),y);}
	var bonfire_x=ini_read_real("DEBUG","PLAYERSPAWN_X_"+string(room_get_name(room)),x);
	var bonfire_y=ini_read_real("DEBUG","PLAYERSPAWN_Y_"+string(room_get_name(room)),y);
	var bonfire=instance_nearest(bonfire_x,bonfire_y,obj_asset_bonfire);
	if instance_exists(bonfire)
	{
		x=bonfire.x-15;
		y=bonfire.y;
	}
	ini_close();
}


if instance_exists(obj_hero)
{
	with obj_hero
	{
		state=states.sit;
		speech_text="";
		//trigger_spawn=false;
		//speed=0;
	}
	alarm[0]=1;
}
else
{
	instance_create(obj_hero);
	alarm[0]=1;
}