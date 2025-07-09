if place_meeting(x,y,obj_hero)
{
	once=false;
	alarm[0]=game_get_speed(gamespeed_fps)*10;
	if global.story_progress<story_progress
	{
		global.story_progress=story_progress;
		global.face_progress=0;
		scr_savegame();
		instance_destroy();
	}
}