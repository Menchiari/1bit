/// @description 
if (!variable_instance_exists(id, "nextclick")) nextclick = false;

if (mouse_check_button_released(mb_any) && collision_point(global.cursor_x, global.cursor_y, self, true, false))
|| nextclick == true
{
	nextclick = false;
	file_delete("save.sav");
	//file_delete("save_death.sav");
	file_delete("random.seed");
	game_restart();
}