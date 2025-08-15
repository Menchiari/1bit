/// @description
nextroom=rm_story_1b;
depth=global.depth_ui_front-1000;
lastframe=image_number-1;
audio_play_sound(snd_cinematic_intro_music,1,false,global.audio_music*.8,0,1)
if instance_exists(obj_hero)
{
	with obj_hero {speech_text="";}
}