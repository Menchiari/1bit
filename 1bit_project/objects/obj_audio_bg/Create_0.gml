/// @description
sound=sound_var;
volume=volume_var;
pitch=pitch_var;
//emitter=audio_play_sound_at(sound,x,y,0,radius_var,range_var,1,true,1,global.audio_backgrounds*volume,0,pitch_var);
emitter=scr_audio_play(sound,global.audio_backgrounds*volume,pitch_var,loop_var,radius_var,range_var);
sound_active=true;
global_audio_backgrounds=global.audio_backgrounds;