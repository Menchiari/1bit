/// @description 
if instance_exists(obj_hero)
{
	if item_type==0
	{
		if new_item==original_item_weapon {room_goto_next();}
		else {original_item=original_item_weapon;global.player_weapon=new_item;}
	}
	if item_type==1
	{
		if new_item==original_item_armor {room_goto_next();}
		else {original_item=original_item_armor;global.player_armor=new_item;}
	}
	if item_type==2
	{
		if new_item==original_item_helm {room_goto_next();}
		else {original_item=original_item_helm;global.player_helm=new_item;}
	}
	with obj_hero {scr_init_hero();}
}