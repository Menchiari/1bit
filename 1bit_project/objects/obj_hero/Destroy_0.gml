// Inherit the parent event
event_inherited();

global.deathcount+=1;

instance_create(obj_fx_screenshake);
instance_create(obj_death);

global.followers = [];

object_set_persistent(object_index,false);

scr_audio_play(snd_death1,1*global.audio_death);
scr_audio_play(snd_death2,1.3*global.audio_death);