if instance_exists(obj_asset_bonfire)
{
	ini_open("save.sav");
	if ini_read_real("DEBUG","PLAYERSPAWN_X_"+string(room_get_name(room)),x) !=x {x=ini_read_real("DEBUG","PLAYERSPAWN_X_"+string(room_get_name(room)),x);}
	if ini_read_real("DEBUG","PLAYERSPAWN_Y_"+string(room_get_name(room)),y) !=y {y=ini_read_real("DEBUG","PLAYERSPAWN_Y_"+string(room_get_name(room)),y);}
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