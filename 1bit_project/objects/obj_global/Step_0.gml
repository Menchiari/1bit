if mouse_check_button_released(mb_any) //show click effect on ground
{
	if instance_exists(obj_hero)
	{
		instance_create_depth(mouse_x,mouse_y,-y,obj_click);
	}
}

if room==rm_menu {UI=false;}
else {UI=true;}

{////////////////////////SHADER////////////////////////////
//set time
time += 1 / room_speed;
//set flicker
if active_flicker==true flk = random_range(-flicker_amt,0);
else flk = 0;
//////////////////////////////////////////////////////////
}
