/// @description RESTART
if global.debug==true
{

if debug=true
{
	//if file_exists("random.seed") {file_delete("random.seed");}
	game_restart();
}
if keyboard_check(vk_control)
{
	global.face_progress=0;
	scr_savegame();
}

}