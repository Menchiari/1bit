alpha-=fade_speed;
audio_master_gain(1-alpha);
if alpha<0 instance_destroy();