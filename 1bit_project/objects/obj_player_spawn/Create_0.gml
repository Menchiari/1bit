/// @description bonfire

ini_open("save.sav");
	//if ini_read_real("DEBUG","PLAYERSPAWN_X_"+string(room_get_name(room)),x) !=x {x=ini_read_real("DEBUG","PLAYERSPAWN_X_"+string(room_get_name(room)),x);}
	//if ini_read_real("DEBUG","PLAYERSPAWN_Y_"+string(room_get_name(room)),y) !=y {y=ini_read_real("DEBUG","PLAYERSPAWN_Y_"+string(room_get_name(room)),y);}
	var bonfire_x=ini_read_real("DEBUG","PLAYERSPAWN_X_"+string(room_get_name(room)),x);
	var bonfire_y=ini_read_real("DEBUG","PLAYERSPAWN_Y_"+string(room_get_name(room)),y);
ini_close();


var bonfire=collision_circle(bonfire_x,bonfire_y,50,obj_asset_bonfire,false,false);
if instance_exists(bonfire)
{
	x=bonfire.x-15;
	y=bonfire.y;
}

if instance_exists(obj_hero)
{
	obj_hero.x=x;
	obj_hero.y=y;
	//obj_hero.speed=0;
	show_debug_message("Hero was moved through obj_player_spawn in x:"+string(x)+", y:"+string(y));
}
else
{
	instance_create(obj_hero);
	obj_hero.state=states.sit;
	obj_hero.speech_text="";
	obj_hero.x=x;obj_hero.y=y;
	//obj_hero.speed=0;
	show_debug_message("Hero was created");
}

instance_destroy();