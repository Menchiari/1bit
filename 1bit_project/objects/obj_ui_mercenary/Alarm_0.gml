//replaces with not deleting other instance

//mercenary=collision_circle(x,y,10,obj_character,true,true);//instance_create(obj_ally_ai);
mercenary=collision_circle(x,y,10,obj_character,true,true);
if instance_exists(mercenary)
{
	mercenary.ai_state_original=ai_states.null;

	equip_weapon(mercenary.weapon);//15
	equip_armor(mercenary.armor);
	equip_helm(mercenary.helm);
	name=mercenary.name;
	description_str=mercenary.str;
	description_res=mercenary.res;
	description_spd=mercenary.spd;
	description_cha=mercenary.cha;

	chosen_column=3;
	button_pressed=0;
	shop_text="HIRE";
	shop_text_cancel="HIRE";
	description="a mercenary ready to be hired";
	shop_text_color=c_white;

	//equipment stuff
	slot_name[0]=mercenary.weapon.name;
	slot_name[1]=mercenary.armor.name;
	slot_name[2]=mercenary.helm.name;

	slot_sprite[0]=mercenary.weapon_sprite;
	slot_sprite[1]=mercenary.armor.sprite;
	slot_sprite[2]=mercenary.helm.sprite;
	slot_description[0]=mercenary.weapon.description;
	slot_description[1]=mercenary.armor.description;
	slot_description[2]=mercenary.helm.description;
}
else instance_destroy();