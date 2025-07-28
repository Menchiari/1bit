/// @description
life=1;
time=game_get_speed(gamespeed_fps)*120;
alarm[0]=time
scr_audio_play(snd_torch_activate,.5);

with (obj_torch) {if (id != other.id) {instance_destroy();}}