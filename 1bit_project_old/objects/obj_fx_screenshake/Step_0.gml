if instance_number(obj_fx_screenshake)>1 {instance_destroy();}
if shake>max_shake {shake=max_shake;}

else
{
	if instance_exists(obj_camera)
	{
		var range=shake;
		obj_camera.x=view_x+random_range(-range,range);
		obj_camera.y=view_y+random_range(-range,range);
		shake *= .75;
		if shake < .25
		{
			obj_camera.x=view_x;
			obj_camera.y=view_y;
			instance_destroy();
		}
	}
}