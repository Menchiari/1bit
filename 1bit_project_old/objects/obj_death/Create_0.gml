global.deathcount+=1;

depth=global.depth_ui+1;
if instance_exists(obj_time_freeze) instance_destroy(obj_time_freeze);
if instance_exists(obj_fx_flash) instance_destroy(obj_fx_flash);

default_gamma=global.gamma_default;
flash=false;

gamma_multiplier=.87//.8;
reduction_speed=.075//.01//.025;

room_speed_set=6//.75;//exact room speed (not like fx time)

var start_all=irandom_range(0,6);//how long before everything starts
var variety=irandom_range(-5,5);

alarm[0]=start_all; //start gamma and flash
alarm[1]=start_all+20+variety;//remove time
alarm[2]=start_all+25+variety;//remove flash
alarm[3]=start_all+variety+235;//destroy

alarm[4]=room_speed*2;
alarm[5]=room_speed*6;

fadeout=false;

sprite=spr_hero;
dir=choose(1,-1);
size=1;
rot=random_range(-30,30);
dead_mannequin=instance_nearest(x,y,obj_dead);

scr_savegame();