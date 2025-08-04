/// @description 
if instance_exists(obj_hero)
{
	if speed>0 {speed-=.1;}
	if speed<0 {speed+=.1;}
	if point_distance(x,y,obj_hero.x,obj_hero.y)<=range
	{
		move_towards_point(obj_hero.x,obj_hero.y,point_distance(x,y,obj_hero.x,obj_hero.y)/20);
		if point_distance(x,y,obj_hero.x,obj_hero.y)<10
		{
			global.xp+=xp_value;
			if instance_exists(obj_global) {obj_global.global_xp=global.xp;}
			var _sound = choose(
		    snd_xp_01,
		    snd_xp_02,
		    snd_xp_03,
		    snd_xp_04,
		    snd_xp_05,
		    snd_xp_06,
		    snd_xp_07,
		    snd_xp_08,
		    snd_xp_09,
		    snd_xp_10,
		    snd_xp_11
			);
			scr_audio_play(_sound,0.7*global.audio_ui,random_range(1,1.2));

			instance_destroy();
		}
	}
}