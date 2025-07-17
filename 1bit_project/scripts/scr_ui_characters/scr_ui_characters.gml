function scr_ui_characters()
{
	switch character_select
	{
		case 0:
			character_face=beard;
			character_name="Kan";
			character_description="from the north";
			character_head_var=spr_head_beard1;
			character_body_var=spr_body_naked;
		break;
		case 1:
			character_face=citrus2;
			character_name="Ara";
			character_description="from the west";
			character_head_var=spr_head_female2;
			character_body_var=spr_body_naked;
		break;
		case 2:
			character_face=gumdrop2;
			character_name="Meu";
			character_description="from the east";
			character_head_var=spr_head_female;
			character_body_var=spr_body_naked;
		break;
		case 3:
			character_face=cupcake2;
			character_name="Joy";
			character_description="from the south";
			character_head_var=spr_head_female1;
			character_body_var=spr_body_naked;
		break;
		case 4:
			character_face=spr_null;
			character_name="hel";
			character_description="from above";
			character_head_var=spr_head_skull;
			character_body_var=spr_body_skeleton;
		break;
		case 5:
			character_face=spr_null;
			character_name="rot";
			character_description="from below";
			character_head_var=spr_head_infected;
			character_body_var=spr_body_infected;
		break;
		default:
		break;
	}
	
	global.player_head=character_head_var;
	//global.player_skin=character_body_var;
	if instance_exists(obj_hero)
	{
		obj_hero.character_head=character_head_var;
		obj_hero.character_body=character_body_var;
	}

}