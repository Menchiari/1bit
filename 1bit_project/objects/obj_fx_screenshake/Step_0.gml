if instance_number(obj_fx_screenshake)>1 {instance_destroy(); exit;}

// decay shake regardless of camera existence
shake = min(shake, max_shake);
shake *= .75;

// vibration tracks shake
var _gp = variable_global_exists("gamepad_slot") ? global.gamepad_slot : 0;
if (_gp >= 0)
{
	if (shake >= .25)
	{
		var _vib = clamp(shake / max_shake, 0, 1);
		gamepad_set_vibration(_gp, _vib, _vib * 0.6);
	}
	else
	{
		gamepad_set_vibration(_gp, 0, 0);
	}
}

// camera shake (only when camera exists)
if (shake >= .25 && instance_exists(obj_camera))
{
	var range = shake;
	obj_camera.x = view_x + random_range(-range, range);
	obj_camera.y = view_y + random_range(-range, range);
}
else
{
	if instance_exists(obj_camera)
	{
		obj_camera.x = view_x;
		obj_camera.y = view_y;
	}
	if (destroyed == false)
	{
		destroyed = true;
		alarm[0] = 1;
	}
}