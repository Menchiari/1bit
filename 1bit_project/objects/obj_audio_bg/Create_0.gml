/// @description
sound=sound_var;
volume=volume_var;
pitch=pitch_var;
emitter=audio_play_sound_at(sound,x,y,0,200,300,1,true,1,global.audio_backgrounds*volume,0,pitch_var);
emitter=audio_play_sound(sound,1,1,global.audio_backgrounds*volume,0,pitch_var);
sound_active=false;