/// @description
if text!=""
{
	var sep=6
	var maxwidth=60;
	draw_set_font(fnt_dialogue);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	//draw_set_colour(c_black);
	//draw_set_alpha(alpha);
	draw_text_ext_colour(x+1,y+1,text,sep,maxwidth,0,0,0,0,alpha);
	draw_text_ext_colour(x+1,y-1,text,sep,maxwidth,0,0,0,0,alpha);
	draw_text_ext_colour(x-1,y+1,text,sep,maxwidth,0,0,0,0,alpha);
	draw_text_ext_colour(x-1,y-1,text,sep,maxwidth,0,0,0,0,alpha);

	draw_text_ext_colour(x+2,y+2,text,sep,maxwidth,0,0,0,0,alpha);
	draw_text_ext_colour(x+2,y-2,text,sep,maxwidth,0,0,0,0,alpha);
	draw_text_ext_colour(x-2,y+2,text,sep,maxwidth,0,0,0,0,alpha);
	draw_text_ext_colour(x-2,y-2,text,sep,maxwidth,0,0,0,0,alpha);

	draw_text_ext_colour(x+1,y+2,text,sep,maxwidth,0,0,0,0,alpha);
	draw_text_ext_colour(x+1,y-2,text,sep,maxwidth,0,0,0,0,alpha);
	draw_text_ext_colour(x-1,y+2,text,sep,maxwidth,0,0,0,0,alpha);
	draw_text_ext_colour(x-1,y-2,text,sep,maxwidth,0,0,0,0,alpha);
	
	//draw_set_colour(_color);	
	draw_text_ext_colour(x,y,text,sep,maxwidth,_color,_color,_color,_color,alpha);
}
