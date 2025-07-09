x=room_width/2-sprite_width/2;

lineax1=random_range(0,sprite_width);
lineax2=random_range(0,sprite_width);
linebx1=random_range(0,sprite_width);
linebx2=random_range(0,sprite_width);
linecx1=random_range(0,sprite_width);
linecx2=random_range(0,sprite_width);
selected=false;

text="";
color=c_white;
alpha=1;
font=fnt_dialogue;

character_select=irandom_range(0,3);
character_face=spr_null;
character_name="";
character_description="";
character_head_var=global.player_head;

switch character_head_var
{
	case spr_head_female:
	character_select=2;
	break;
	case spr_head_female1:
	character_select=3;
	break;
	case spr_head_female2:
	character_select=1;
	break;
	case spr_head_beard1:
	character_select=0;
	break;
}