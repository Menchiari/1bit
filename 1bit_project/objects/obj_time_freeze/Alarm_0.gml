if instance_number(obj_time_freeze)>max_amount {instance_destroy();}
else
{
	game_set_speed(game_get_speed(gamespeed_fps)*room_speed_modifier,gamespeed_fps);// room_speed=room_speed*room_speed_modifier;
	alarm[1]=room_speed_reset_time;
}