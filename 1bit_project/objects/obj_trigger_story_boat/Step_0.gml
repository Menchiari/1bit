if place_meeting(x,y,obj_hero)
{
	global.story_progress=story_progress;
	global.face_progress=0;
	scr_savegame();
	instance_destroy();
	room_goto(nextroom);
}