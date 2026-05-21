// --- MOUSE: hover highlight + click activation ---
if (!global.using_gamepad)
{
	if mouse_check_button(mb_any) && collision_point(mouse_x,mouse_y,self,true,false)
	{ selected=true; }
	else { selected=false; }
}
// (when using_gamepad, selected is set by obj_face_parent in the question state)

// --- ACTIVATION: mouse click OR gamepad A ---
var _activate = false;
if (!global.using_gamepad && mouse_check_button_released(mb_any) && collision_point(mouse_x,mouse_y,self,true,false))
{ _activate = true; }
if (global.using_gamepad && global.action_released && selected)
{
	// only activate if question text is fully visible (prevents accidental skip)
	if (!instance_exists(obj_face_parent) || obj_face_parent.txt_progress >= string_length(obj_face_parent.txt))
	{ _activate = true; }
}

if (_activate)
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
			obj_face_parent.txt_progress=0;
			obj_face_parent.state="talk";
			obj_face_parent.question=false;
			obj_face_parent.image_index=0;
			obj_face_parent.image_speed=obj_face_parent.image_speed_default;
		}
		show_debug_message("number "+string(nextnumber));
	}
	for (var i = 0; i < instance_number(obj_face_button); i++)
	{instance_destroy(obj_face_button);}
}
