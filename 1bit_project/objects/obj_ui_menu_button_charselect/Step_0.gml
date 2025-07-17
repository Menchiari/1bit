if mouse_check_button(mb_any) && collision_point(mouse_x,mouse_y,self,true,false) {selected=true;}
else {selected=false;}
if mouse_check_button_released(mb_any)
{
	text=""
	
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
	
	var min_sel=0;
	var max_sel=3;
	if global.story_progress==0 {min_sel=1; max_sel=2;}
	else if global.story_progress>=4 {min_sel=0; max_sel=5;}
	else {min_sel=0; max_sel=3;}

	min_sel=0;
	max_sel=5;

	
	if character_select<min_sel {character_select=max_sel;}
	if character_select>max_sel {character_select=min_sel;}
	
	scr_ui_characters();
}