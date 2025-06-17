/// @description 
if mouse_check_button_released(mb_any) && collision_point(mouse_x,mouse_y,self,true,false)
{
	file_delete("save.sav");
	file_delete("random.seed");
	game_restart();
}