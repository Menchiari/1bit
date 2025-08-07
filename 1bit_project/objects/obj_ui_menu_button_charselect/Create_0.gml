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

character_select=irandom_range(1,2);
character_face=spr_null;
character_name="";
character_description="";
character_head_var=global.player_head;
character_body_var=global.player_skin;

if character_head_var=spr_head_beard1 {character_select=0;}
if character_head_var=spr_head_female2 {character_select=1;}
if character_head_var=spr_head_female {character_select=2;}
if character_head_var=spr_head_female1 {character_select=3;}
if character_head_var=spr_head_skull {character_select=4;}
if character_head_var=spr_head_infected {character_select=5;}
if character_head_var=spr_head {character_select=6;}

scr_ui_characters();

show_debug_message("story progress = "+string(global.story_progress));