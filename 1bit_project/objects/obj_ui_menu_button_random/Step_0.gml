/// @description 
if mouse_check_button(mb_any) && collision_point(mouse_x,mouse_y,self,true,false) {selected=true;}
else {selected=false;}

if mouse_check_button_released(mb_any) && collision_point(mouse_x,mouse_y,self,true,false)
{
	
	var weaponsel=irandom_range(0,66);
	var armorsel=irandom_range(0,42);
	var helmsel=irandom_range(0,36);
	
	show_debug_message("random weapon: "+string(weaponsel))
	show_debug_message("random armor: "+string(armorsel))
	show_debug_message("random helm: "+string(helmsel))
	
	if ds_list_find_index(global.unlock_wpn,weaponsel)=-1
	{ds_list_add(global.unlock_wpn,weaponsel);}
	if ds_list_find_index(global.unlock_arm,armorsel)=-1
	{ds_list_add(global.unlock_arm,armorsel);}
	if ds_list_find_index(global.unlock_hlm,helmsel)=-1
	{ds_list_add(global.unlock_hlm,helmsel);}
	
	with (obj_ui_menu_button_gear)
	{
		switch (type)
		{
		case 0: //weapon
			global.player_weapon=global.weapons[weaponsel];
			text=global.player_weapon.name;
		break;
		case 1: //armor
			global.player_armor=global.armors[armorsel];
			text=global.player_armor.name;
		break;
		case 2: //helm
			global.player_helm=global.helms[helmsel];
			text=global.player_helm.name;
		break;
		default:
		break;
		}
	}
	
	with (obj_hero)
	{
		scr_init_hero();
	}
}