/// @description
var round_number=round(number*100)
if number>0
{
	draw_text_color(x+1,y+1,string(round_number),c_black,c_black,c_black,c_black,1);
	draw_text_color(x+1,y-1,string(round_number),c_black,c_black,c_black,c_black,1);
	draw_text_color(x-1,y+1,string(round_number),c_black,c_black,c_black,c_black,1);
	draw_text_color(x-1,y-1,string(round_number),c_black,c_black,c_black,c_black,1);

	draw_text_color(x,y,string(round_number),_color,_color,_color,_color,1);
}

if text!=""
{
	draw_text_color(x+1,y+1,text,c_black,c_black,c_black,c_black,1);
	draw_text_color(x+1,y-1,text,c_black,c_black,c_black,c_black,1);
	draw_text_color(x-1,y+1,text,c_black,c_black,c_black,c_black,1);
	draw_text_color(x-1,y-1,text,c_black,c_black,c_black,c_black,1);

	draw_text_color(x,y,text,_color,_color,_color,_color,1);
}