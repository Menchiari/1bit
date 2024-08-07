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
			ini_write_real("DEBUG","PLAYERSPAWN_X",x+(choose(10,-10)));
			ini_write_real("DEBUG","PLAYERSPAWN_Y",y);
			ini_close();
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
				size=.1;
				state=0;
			}
		}
	break;
}
