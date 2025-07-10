if mouse_check_button(mb_any) && collision_point(mouse_x,mouse_y,self,true,false)
{
	selected=true;
}
else {selected=false;}

if mouse_check_button_released(mb_any) && collision_point(mouse_x,mouse_y,self,true,false)
{
	if instance_exists(obj_face_parent)
	{
		if nextnumber==-1
		{
			room_goto(nextroom);
		}
		else
		{
			obj_face_parent.txt_phase=nextnumber;
			obj_face_parent.timer=0;
			obj_face_parent.state="talk"
		}
		show_debug_message("number "+string(nextnumber));
	}
	for (var i = 0; i < instance_number(obj_face_button); i++)
	{instance_destroy(obj_face_button);}
}
