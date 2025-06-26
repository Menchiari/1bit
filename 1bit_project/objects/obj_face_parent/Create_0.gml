/// @description
txt="";
txt_posx=x+90;
txt_posy=y+25;
txt_color=c_white;
txt_phase=-1;
txt_speed=game_get_speed(gamespeed_fps)/24;
txt_auto=true;
txt_progress=0;
txt_progress_spd=0.5;

timer=0;
wait_time=game_get_speed(gamespeed_fps)*3;
idle_time=game_get_speed(gamespeed_fps)*5;

state="wait";
sprite=sprite_index;
image_speed_default=1;
color=c_white;
blink_hold=0;
face_progress=global.face_progress;
face_progress_death=global.face_progress_death;

next_room=rm_menu_character;

show_debug_message(string(face_progress)+" face progress")