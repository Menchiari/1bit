///@description reset
game_set_speed(global.room_speed_default,gamespeed_fps); //room_speed=global.room_speed_default;
if instance_exists(obj_global) {obj_global.g=default_gamma;}
fadeout=true;