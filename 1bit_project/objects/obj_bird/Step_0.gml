/// @description
if instance_exists(obj_hero)
{
	if point_distance(x,y,obj_hero.x,obj_hero.y)<320 {active=true}
	else {active=false;}
}

if active==true
{
	switch state
	{
		case 0://idle
			if image_index>idle_b+1 {image_index=idle_a;}
			image_speed=random_range(.05,.5);
			if instance_exists(obj_character)
			{
				var _threat=instance_nearest(x,y,obj_character);
				if instance_exists(_threat)
				{
					if point_distance(x,y,_threat.x,_threat.y)<active_range
					{
						if _threat.state==states.run
						|| _threat.state==states.roll
						|| _threat.state==states.attack
						|| _threat.state==states.attack_strong
						{
							image_index=takeoff_a;
							image_speed=1;
							state=1;
						}
					}
				}
			}
		break;
		case 1://alert
			if image_index>takeoff_b
			{
				state=2;
				image_index=fly_a;
				image_speed=random_range(1,2);
				var _pigeon_audio=choose(snd_pigeons_1,snd_pigeons_2,snd_pigeons_3,snd_pigeons_4,snd_pigeons_5,snd_pigeons_6);
				scr_audio_play(_pigeon_audio,global.audio_backgrounds*0.066,random_range(.7,1.2));
				if instance_exists(obj_bird)
				{
					var _bird=instance_nearest(x,y,obj_bird);
					if instance_exists(_bird)
					{
						if point_distance(x,y,_bird.x,_bird.y)<active_range
						{
							if _bird.state==0 {_bird.state=1;}
						}
					}
				}
			}
		break;
		case 2://fly
			x+=fly_speed_x;
			y+=fly_speed_y;
			image_speed=flying_speed_anim;
			if image_index>=fly_b-1 {image_index=fly_a;}
			if point_distance(x,y,x_origin,y_origin)>700 {instance_destroy();}
			state=2;
		break;
	}
}