alpha-=fade_speed;
audio_master_gain(1-alpha);
if alpha<0 {audio_master_gain(1); instance_destroy();}