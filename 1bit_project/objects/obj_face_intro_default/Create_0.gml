/// @description
txt="";
txt_posx=x+90;
txt_posy=y+25;
txt_color=c_white;
txt_phase=-1;
txt_speed=game_get_speed(gamespeed_fps)/22;
txt_auto=true;

timer=0;
wait_time=game_get_speed(gamespeed_fps)*3;
idle_time=game_get_speed(gamespeed_fps)*5;

state="wait";
sprite=sprite_index;
image_speed_default=1;
color=c_white;
blink_hold=0;

next_room=rm_story_1;