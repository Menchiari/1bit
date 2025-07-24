/// @description
if instance_exists(obj_camera)
{
	if point_distance(obj_camera.x,obj_camera.y,x,y)<range_var {sound_active=true;}
	else {sound_active=false;}
}

if sound_active==false
{
	if audio_is_playing(emitter)
	{
		audio_stop_sound(emitter)
		show_debug_message("stopping sound "+string(emitter));
	}
}
else
{
	if !audio_is_playing(emitter)
	{
		emitter=scr_audio_play(sound,global.audio_backgrounds*volume,pitch_var,true,radius_var,range_var);
		show_debug_message("playing sound "+string(emitter));
	}
}