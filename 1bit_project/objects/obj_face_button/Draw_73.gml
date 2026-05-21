draw_sprite(sprite_index,image_index,x,y);

draw_set_font(font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_color(x+sprite_width/2,y+(sprite_height/2)-1,txt,color,color,color,color,1);

if selected==true
{
	var border=2;
	var _outline = global.using_gamepad;
	draw_rectangle_color(x+border,y+border,x+sprite_width-border,y+sprite_height-border,c_white,c_white,c_white,c_white,_outline);
}