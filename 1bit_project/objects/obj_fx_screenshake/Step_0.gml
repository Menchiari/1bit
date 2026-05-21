if instance_number(obj_fx_screenshake)>1 {instance_destroy();}
if shake>max_shake {shake=max_shake;}

else
{
	// Gamepad vibration proportional to shake (0-1 range)
	var _vib = clamp(shake / max_shake, 0, 1);
	gamepad_set_vibration(0, _vib, _vib * 0.6);

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
			gamepad_set_vibration(0, 0, 0);
			instance_destroy();
		}
	}
}