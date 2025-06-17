if instance_exists(obj_asset_bonfire)
{
	ini_open("save.sav");
	x=ini_read_real("DEBUG","PLAYERSPAWN_X",x);
	y=ini_read_real("DEBUG","PLAYERSPAWN_Y",y);
	ini_close();
}


if !instance_exists(obj_hero)
{
	instance_create(obj_hero);
}
else
{
	obj_hero.x=x;obj_hero.y=y;
}
if instance_number(obj_hero)>1 {instance_destroy(obj_hero);}