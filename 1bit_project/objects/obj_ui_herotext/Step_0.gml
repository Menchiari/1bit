var height=28;

if instance_exists(target)
{
	if point_distance(x,y,target.x,target.y)<trigger_distance
	{
		text=dialogue;
		x=target.x;
		y=target.y-height;
		if once==true
		{
			once=false;
			alarm[0]=game_get_speed(gamespeed_fps)*time_in_sec;
		}
		if fade=true
		{
			alpha-=fadespeed;
			if alpha<=0 instance_destroy();
		}
	}
}
