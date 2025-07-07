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
	}
	if image_index>=end_frame
	{start_anim=false; alarm[1]=1;}
}