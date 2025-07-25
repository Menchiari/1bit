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
		var _sound = choose(
		    snd_breakable_generic_1, snd_breakable_generic_2, snd_breakable_generic_3, snd_breakable_generic_4, snd_breakable_generic_5, snd_breakable_generic_6, snd_breakable_generic_7/*,
		    snd_breakable_stone_1, snd_breakable_stone_2, snd_breakable_stone_3, snd_breakable_stone_4, snd_breakable_stone_5,
		    snd_breakable_wood_1, snd_breakable_wood_2, snd_breakable_wood_3, snd_breakable_wood_4, snd_breakable_wood_5, snd_breakable_wood_6, snd_breakable_wood_7*/
		);

		scr_audio_play(_sound,0.5*global.audio_breakable,random_range(.8,1));
		instance_destroy();
		init_pathfinding_grid();
	}
}