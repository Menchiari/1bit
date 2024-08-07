if keyboard_check(vk_alt) && debug=true
{
	room_speed_type+=1;
	if room_speed_type>2 room_speed_type=0;
	switch room_speed_type
	{
		case 0:
		room_speed=global.room_speed_default;
		break;
		case 1:
		room_speed=10;
		break;
		case 2:
		room_speed=5;
		break;
	}
}