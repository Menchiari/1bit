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


alarm[2]=2;