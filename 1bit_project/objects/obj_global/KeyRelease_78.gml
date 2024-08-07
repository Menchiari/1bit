if keyboard_check(vk_alt) && debug=true
{
	if room==room_last room_goto(0);
	else room_goto_next();
}