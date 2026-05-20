/// @description CHANGE TIME SPEED
if global.debug==true
{

//if keyboard_check(vk_alt) && debug=true
if debug==true
{
	room_speed_type+=1;
	if room_speed_type>2 room_speed_type=0;
	switch room_speed_type
	{
		case 0:
		show_debug_message("time speed normal")
		game_set_speed(global.room_speed_default,gamespeed_fps); //room_speed=global.room_speed_default;
		break;
		case 1:
		show_debug_message("time speed 2")
		//game_set_speed(10,gamespeed_fps); //room_speed=10;
		game_set_speed(23333,gamespeed_microseconds); //room_speed=10;
		break;
		case 2:
		show_debug_message("time speed 3")
		//game_set_speed(5,gamespeed_fps); //room_speed=5;
		game_set_speed(3333,gamespeed_microseconds); //room_speed=10;
		break;
	}
}

}