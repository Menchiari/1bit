/// @description
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,color,image_alpha)
	draw_set_font(fnt_dialogue);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(txt_color);
	draw_text(txt_posx,txt_posy,string_copy(txt,1,floor(txt_progress)));
	//draw_text_color_outline(txt_posx,txt_posy,txt,txt_color,1);
	if mouse_check_button(mb_any)
	{
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_dkgray,.5)
	}