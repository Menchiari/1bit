switch(state)
{
	case 0:
		if collision_circle(x,y,range,obj_hero,true,true)
		{
			sizex=1;
			sizey=1;
			if instance_exists(obj_hero){obj_hero.hp=obj_hero.hp_max;}
			scr_savegame();
			ini_open("save.sav");
			ini_write_real("DEBUG","PLAYERSPAWN_X_"+string(room_get_name(room)),x+(choose(-10,-10)));
			ini_write_real("DEBUG","PLAYERSPAWN_Y_"+string(room_get_name(room)),y);
			ini_close();
			scr_audio_play(snd_bonfire_lit,0.5,random_range(.9,1.1));
			repeat(4)
			{
				var wave=instance_create(obj_fx_dustwave);
				wave.color=c_orange;
				wave.alpha=.75;
				wave.dir=choose(1,-1)
			}
			state=1;
		}
	break;
	
	case 1:
		if instance_exists(obj_hero)
		{
			if point_distance(x,y,obj_hero.x,obj_hero.y)>range_reset
			{
				sizex=.1;
				state=0;
			}
		}
	break;
}
