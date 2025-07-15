if mouse_check_button(mb_any) && collision_point(mouse_x,mouse_y,self,true,false) {selected=true;}
else {selected=false;}
if mouse_check_button_released(mb_any)
{
	if point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width/3.5,y+sprite_height)
	{
		//next
		character_select-=1
	}
	if point_in_rectangle(mouse_x,mouse_y,x+sprite_width/3.5,y,x+sprite_width,y+sprite_height) 
	{
		//previous
		character_select+=1
	}
	if character_select<0 {character_select=3;}
	if character_select>3 {character_select=0;}
}

switch character_select
{
	case 0:
		character_face=beard;
		character_name="Kan";
		character_description="from the north";
		character_head_var=spr_head_beard1;
	break;
	case 1:
		character_face=citrus2;
		character_name="Ara";
		character_description="from the west";
		character_head_var=spr_head_female2;
	break;
	case 2:
		character_face=gumdrop2;
		character_name="Meu";
		character_description="from the east";
		character_head_var=spr_head_female;
	break;
	case 3:
		character_face=cupcake2;
		character_name="Joy";
		character_description="from the south";
		character_head_var=spr_head_female1;
	break;
	default:
	break;
}

global.player_head=character_head_var;
if instance_exists(obj_hero){obj_hero.character_head=character_head_var;}