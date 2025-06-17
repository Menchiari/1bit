if mouse_check_button(mb_any) && collision_point(mouse_x,mouse_y,self,true,false) {selected=true;}
else {selected=false;}

if type=0 {text="EQUIP"}
if type=1 {text="DROP"}

if instance_exists(obj_hero)
{		
	if mouse_check_button_released(mb_any)
	{
		if collision_point(mouse_x,mouse_y,self,true,false)
		{
			switch type
			{
				case 0://equip
				break;
				case 1://drop
					if item_type=0 {global.player_weapon=original_item;}
					if item_type=1 {global.player_armor=original_item;}
					if item_type=2 {global.player_helm=original_item;}
					with obj_hero{scr_init_hero();}
				break;
			}
			scr_unlockables(new_item)
			scr_savegame();
			room_goto_next();
		}
	}
}
else room_goto_next();