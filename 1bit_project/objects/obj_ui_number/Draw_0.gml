/// @description
var round_number=round(number*100)
var _sep=7;
var _width=24;
draw_set_halign(fa_center);

if number>0
{
	draw_text_ext_color(x+1,y+1,string(round_number),_sep,_width,c_black,c_black,c_black,c_black,alpha);
	draw_text_ext_color(x+1,y-1,string(round_number),_sep,_width,c_black,c_black,c_black,c_black,alpha);
	draw_text_ext_color(x-1,y+1,string(round_number),_sep,_width,c_black,c_black,c_black,c_black,alpha);
	draw_text_ext_color(x-1,y-1,string(round_number),_sep,_width,c_black,c_black,c_black,c_black,alpha);

	draw_text_ext_color(x,y,string(round_number),_sep,_width,_color,_color,_color,_color,1);
}

if text!=""
{
	draw_text_ext_color(x+1,y+1,text,_sep,_width,c_black,c_black,c_black,c_black,alpha);
	draw_text_ext_color(x+1,y-1,text,_sep,_width,c_black,c_black,c_black,c_black,alpha);
	draw_text_ext_color(x-1,y+1,text,_sep,_width,c_black,c_black,c_black,c_black,alpha);
	draw_text_ext_color(x-1,y-1,text,_sep,_width,c_black,c_black,c_black,c_black,alpha);

	draw_text_ext_color(x,y,text,_sep,_width,_color,_color,_color,_color,alpha);
}