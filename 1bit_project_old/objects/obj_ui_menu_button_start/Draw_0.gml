/*if clicked==true
{
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_set_font(font);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text_color(x,y-2,text,c_white,c_white,c_white,c_white,1)
	//draw_rectangle_color(x+6,y+4,x+sprite_width-6,y+sprite_height-4,c_white,c_white,c_white,c_white,false);
}
else
{
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle+180,image_blend,image_alpha);
	draw_set_font(font);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text_color(x,y-4,text,c_white,c_white,c_white,c_white,1)
}