/// @description

with obj_ui_menu_button_gear
{
	switch (type)
	{
	case 0: //weapon
		text=global.player_weapon.name;
		nextclick=true;
	break;
	case 1: //armor
		text=global.player_armor.name;
		nextclick=true;
	break;
	case 2: //helm
		text=global.player_helm.name;
		nextclick=true;
	break;
	default:
	break;
	}
}