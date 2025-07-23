/// @description
if instance_exists(obj_camera)
{
	if point_distance(obj_camera.x,obj_camera.y,x,y)<150 {sound_active=true;}
	else {sound_active=false;}
}

if sound_active==false {if audio_is_playing(emitter) {audio_stop_sound(emitter)}}
else {if !audio_is_playing(emitter){emitter=audio_play_sound(sound,1,1,global.audio_backgrounds*volume,0,pitch_var);}}