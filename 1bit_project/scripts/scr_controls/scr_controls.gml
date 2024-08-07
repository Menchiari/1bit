up=0;
dwn=0;
left=0;
right=0;
sprint=false;
jump=false;
atk=false;
block=false;

init_globals();
switch(global.control_type)
{
	case controls.keyboard:
		if keyboard_check(vk_up)
		|| keyboard_check(ord("W"))
		{up=1}
		
		if keyboard_check(vk_down)
		|| keyboard_check(ord("S"))
		{dwn=1}
		
		if keyboard_check(vk_left)
		|| keyboard_check(ord("A"))
		{left=1}
		
		if keyboard_check(vk_right)
		|| keyboard_check(ord("D"))
		{right=1}
		
		if keyboard_check(vk_shift)
//		|| keyboard_check(ord("W"))
		{sprint=true}
		
		if keyboard_check(vk_space)
		|| keyboard_check(ord("J"))
		{jump=true}
		
		if keyboard_check(vk_control)
		|| keyboard_check(ord("K"))
		{atk=true}
		
		if keyboard_check(vk_alt)
		|| keyboard_check(ord("L"))
		{block=true}
	break;
	case controls.gamepad:
	break;
	case controls.touch:
	break;	
}
