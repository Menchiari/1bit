depth=-y;
image_speed=0;

hp_max=1;
hp=hp_max;
res=1;
state=states.idle;
alarm[0]=1;

x_orig=x;
y_orig=y;

timer=0;
shake_time=4;

//power of screenshake and object shake
shake_power=1;
shake_power_multiplier=1;

//amount of pieces
debris_min=6;
debris_max=10;

invincible=false;

debris_type=obj_fx_debris;