if instance_exists(obj_hero)
{
	if place_meeting(x,y,obj_hero)||open==true
	{
		repeat(16)
		{
			var debris=instance_create(obj_fx_debris_wood);
			debris.x+=random_range(-20,20);
		}
		if destroy_door!=noone {instance_destroy(destroy_door);}
		
	if (file_exists("save.sav"))
	{
	    ini_open("save.sav");
	    ini_write_real("DEBUG", "DOOR" + string(id), 1);
	    ini_close();
	}

		instance_destroy();
	}
}