/// @description restart
//What a complicate way to choose a post-death room!
if global.deathcount==1 && room==rm_story_caves {room_goto(rm_cinematic_intro);}
else
{
	if room!=rm_death {room_goto(rm_death);}
	else {room_goto(rm_menu_character);}
}