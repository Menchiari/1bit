depth=global.depth_ui;
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

if instance_exists(obj_hero)
{
	if point_distance(obj_hero.x,obj_hero.y,xoriginal,yoriginal)<active_range
	{
		var othershop=collision_circle(x,y,active_range,obj_ui_shop,true,true)
		if othershop==true
		{
			if point_distance(xoriginal,yoriginal,obj_hero.x,obj_hero.y)<point_distance(othershop.x,othershop.y,obj_hero.x,obj_hero.y) {active=1;}
			else {active=0;}
		}
		else {active=1;}
	}
	else {active=0;}
}

if collision_circle(xoriginal,yoriginal,reactive_range,obj_enemy,false,true) {active=0; shop_active=0;}

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
				if point_in_rectangle(mouse_x,mouse_y,x-xoff+19,y-yoff+13,x-xoff+110,y-yoff+85)
				|| point_in_circle(mouse_x,mouse_y,x,y,radius)
				{obj_hero.state=states.idle; obj_hero.dest_x=obj_hero.x;obj_hero.dest_y=obj_hero.y;}
				else {active=0; shop_active=0;}
				
				if button_pressed==1
				{
					//exchange weapon/armor/etc
					switch(chosen_column)
					{
						case 0:
							var shop_weapon=weapon;
							
							if ds_list_find_index(global.unlock_wpn,shop_weapon.index) = -1
							{ds_list_add(global.unlock_wpn,shop_weapon.index);}
											
							
							equip_weapon(obj_hero.weapon);
							with (obj_hero)
							{equip_weapon(shop_weapon);}
							slot_name[0]=weapon.name;
							slot_description[0]=weapon.description;
						break;
						case 1:
							var shop_armor=armor;
							
							if ds_list_find_index(global.unlock_arm,shop_armor.index) = -1
							{ds_list_add(global.unlock_arm,shop_armor.index);}
							
							equip_armor(obj_hero.armor);
							with (obj_hero)
							{equip_armor(shop_armor);}
							slot_name[1]=armor.name;
							slot_description[1]=armor.description;
						break;
						case 2:
							var shop_helm=helm;
							
							if ds_list_find_index(global.unlock_hlm,shop_helm.index) = -1
							{ds_list_add(global.unlock_hlm,shop_helm.index);}
							
							equip_helm(obj_hero.helm);
							with (obj_hero)
							{equip_helm(shop_helm)}
							slot_name[2]=helm.name;
							slot_description[2]=helm.description;
						break;
						default:
						break;
					}
					
					active=0;
					shop_active=0;
					button_pressed=0;
					scr_savegame();
				}
			}
			else
			{
				scr_savegame();
				instance_destroy();
			}
		}
		if instance_exists(obj_camera)
		{
			x=obj_camera.x;
			y=obj_camera.y+sprite_height/2;
		}
	}
	else
	{
		x=xoriginal;
		y=yoriginal;
	}
}