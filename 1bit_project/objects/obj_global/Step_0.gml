if mouse_check_button_released(mb_any) //show click effect on ground
{
	if instance_exists(obj_hero) {
		with obj_hero {
			if can_character_navigate(dest_x,dest_y) {instance_create_depth(mouse_x,mouse_y,-y,obj_click);}
			//else {scr_audio_play(snd_error);}
		}
	}
}

if room==rm_menu
|| room==rm_faces_default
|| room==rm_death
|| room==rm_faces_death
|| room==rm_faces_princess
|| room==rm_faces_boss_intro
|| room==rm_faces_boss_death
|| room==rm_boat
|| room==rm_faces_ai
|| room==rm_faces_boat
|| room==rm_story_1
|| room==rm_story_1_stairs
|| room==rm_story_1b
|| room==rm_story_2
|| room==rm_story_caves
|| room==rm_story_AI
|| room==rm_story_AI_2
|| room==rm_glitch
|| room==rm_doomtext
|| room==rm_cinematic_intro
{
	UI=false;
	if instance_exists(obj_camera_pos) {with obj_camera_pos {no_ui=true;}}
}
else {UI=true;}

{////////////////////////SHADER////////////////////////////
//set time
time += 1 / game_get_speed(gamespeed_fps);
//show_debug_message(string(time));
//set flicker
if active_flicker==true flk = random_range(-flicker_amt,0);
else flk = 0;
//////////////////////////////////////////////////////////
}