// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_text_color_outline(_xpos,_ypos,_string,_color,_alpha){
	draw_text_color(_xpos+1,_ypos+1,_string,0,0,0,0,_alpha);
	draw_text_color(_xpos+1,_ypos-1,_string,0,0,0,0,_alpha);
	draw_text_color(_xpos-1,_ypos+1,_string,0,0,0,0,_alpha);
	draw_text_color(_xpos-1,_ypos-1,_string,0,0,0,0,_alpha);
	
	draw_text_color(_xpos,_ypos,_string,_color,_color,_color,_color,_alpha);
	return(_string);
}