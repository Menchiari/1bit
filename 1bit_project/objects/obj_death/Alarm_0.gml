///@description start flash
if instance_exists(obj_global)
{
	obj_global.g=global.gamma_default;
	obj_global.g=obj_global.g*gamma_multiplier;
}
flash=true;
game_set_speed(room_speed_set,gamespeed_fps);//room_speed=room_speed_set;