/// @description
draw_sprite(sprite_index,image_index,x,y);
if level>0 && image_index>0
{
	var _xp_color=c_ltgray;
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text_color(x,y-10,to_roman(level),_xp_color,_xp_color,_xp_color,_xp_color,.8)
}