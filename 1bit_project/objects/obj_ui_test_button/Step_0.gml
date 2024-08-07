/// @description 
if mouse_check_button(mb_any)&&collision_point(mouse_x,mouse_y,self,true,false) {pressed=true;}
else {pressed=false;}
if mouse_check_button_released(mb_any)&&collision_point(mouse_x,mouse_y,self,true,false)
{
	global.player_weapon=selected_gear;
	room_goto(next_room);
}