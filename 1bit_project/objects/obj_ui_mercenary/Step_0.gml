depth=-y;

if instance_exists(mercenary)
{
	x=mercenary.x;
	y=mercenary.y;
	x0=x-xoff+21;
	x1=x-xoff+50;
	x2=x-xoff+78;
	x3=x-xoff+107;
	y0=y-yoff+24;
	y1=y-yoff+42;
	bx0=x-xoff+22;
	bx1=x-xoff+106;
	by0=y-yoff+69;
	by1=y-yoff+85;
	
	tx1=x-xoff+20;
	ty1=y-yoff+13;
	tx2=x-xoff+109;
	ty2=y-yoff+24;

	cx1=x-xoff+20;
	cy1=y-yoff+42;
	cx2=x-xoff+109;
	cy2=y-yoff+68;
}
else {instance_destroy();}

if instance_exists(obj_hero)
{
	if point_distance(obj_hero.x,obj_hero.y,x,y)<active_range {active=1;}
	else {active=0;}
}
if collision_circle(x,y,reactive_range,obj_enemy,false,true) {active=0; shop_active=0;}

if active==1
{
	if mouse_check_button_released(mb_any) && point_in_circle(mouse_x,mouse_y,x,y,radius) {shop_active=1;}
	if shop_active==1
	{
		if mouse_check_button_released(mb_any)
		{
			if point_in_rectangle(mouse_x,mouse_y,x0,y0,x1,y1) {if chosen_column==0 chosen_column=3 else chosen_column=0;}
			if point_in_rectangle(mouse_x,mouse_y,x1,y0,x2,y1) {if chosen_column==1 chosen_column=3 else chosen_column=1;}
			if point_in_rectangle(mouse_x,mouse_y,x2,y0,x3,y1) {if chosen_column==2 chosen_column=3 else chosen_column=2;}	
			if point_in_rectangle(mouse_x,mouse_y,tx1,ty1,tx2,ty2) {chosen_column=3;}
			if point_in_rectangle(mouse_x,mouse_y,cx1,cy1,cx2,cy2,) {stats=!stats;}
			if point_in_rectangle(mouse_x,mouse_y,bx0,by0,bx1,by1) {button_pressed=1;}
			else {button_pressed=0;}
		}
		if mouse_check_button_released(mb_any)
		{
			if instance_exists(obj_hero)
			{
				//make hero still
				if point_in_rectangle(mouse_x,mouse_y,x-xoff+19,y-yoff+13,x-xoff+110,y-yoff+85) || point_in_circle(mouse_x,mouse_y,x,y,radius)
				{obj_hero.state=states.idle; obj_hero.dest_x=obj_hero.x;obj_hero.dest_y=obj_hero.y;}
				else {active=0; shop_active=0;}
				
				if button_pressed==1
				{
					mercenary.ai_state_original=ai_states.follow;
					mercenary.ai_state=ai_states.follow;
					mercenary.state=states.idle;
					mercenary.control=controls.ai;
					mercenary.faction=factions.ally;
					instance_destroy();
				}
			}
			else
			{
				instance_destroy();
			}
		}
	}
}