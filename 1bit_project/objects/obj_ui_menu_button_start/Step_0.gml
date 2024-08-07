if active==true
{
	if mouse_check_button_released(mb_any)
	{
		//if collision_point(mouse_x,mouse_y,self,true,false)
		//{
			alarm[0]=room_speed;
			active=false;
			var fade=instance_create(obj_fx_fadeout);
			fade.fade_speed=.1;
		//}
	}
}
if mouse_check_button(mb_any)
{
	if collision_point(mouse_x,mouse_y,self,true,false) {clicked=true;}
	else {clicked=false;}
}