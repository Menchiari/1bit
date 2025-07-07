start_anim=false;
sprite_index=sprite;
image_speed=0;
image_index=start_frame;
depth=-y;

if instance_exists(obj_asset_bonfire)
{
	ini_open("save.sav");
	if ini_read_real("DEBUG","PLAYERSPAWN_X_"+string(room_get_name(room)),x) !=x {x=ini_read_real("DEBUG","PLAYERSPAWN_X_"+string(room_get_name(room)),x);}
	if ini_read_real("DEBUG","PLAYERSPAWN_Y_"+string(room_get_name(room)),y) !=y {y=ini_read_real("DEBUG","PLAYERSPAWN_Y_"+string(room_get_name(room)),y);}
	ini_close();
}


if instance_exists(obj_hero)
{
	obj_hero.x=x;obj_hero.y=y;
	obj_hero.state=states.null;
	obj_hero.speech_text="";
	obj_hero.speed=0;
	with (obj_hero) {visible = false;}
	depth=obj_hero.depth;
	alarm[0]=time_before_activating;
}
else
{
	instance_create(obj_hero);
	alarm[0]=time_before_activating;
}