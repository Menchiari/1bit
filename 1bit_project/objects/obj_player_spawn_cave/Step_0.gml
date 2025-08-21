/// @description
if start_anim==true
{
	image_speed=1;
	if image_index==9
	{
		instance_create(obj_fx_screenshake);
		var blood=instance_create(obj_fx_blood);
		with blood
		{
			scale_x=.3;
			scale_y=.1;
			rot=random_range(-5,5);
			color=global.blood_color;
			alpha=.4;
		}
		audio_play_sound(snd_wpn_hurt_02,1,0,.2,0,1);
		audio_play_sound(snd_fall_asf_1,1,0,.15,0,1);
		audio_play_sound(snd_breakable_stone_1,1,0,.15,0,2);
	}
	if image_index>=end_frame
	{start_anim=false; alarm[1]=1;}
}