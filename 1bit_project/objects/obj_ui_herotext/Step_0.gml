if instance_exists(target)
{
	if point_distance(x,y,target.x,target.y)<trigger_distance
	{
		text=dialogue;
		x=target.x;
		y=target.y;
		//x=round(target.x);
		//y=round(target.y);
		if once==true
		{
			once=false;
			alarm[0]=game_get_speed(gamespeed_fps)*time_in_sec;
			audio_play_sound(sound_var,1,0,sound_vol,0,1)
		}
		if fade=true
		{
			alpha-=fadespeed;
			if alpha<=0 instance_destroy();
		}
	}
}

depth=text_depth;//-y-3000;