/// @description
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,color,image_alpha)
	draw_set_font(fnt_faces);
	draw_set_halign(fa_center);
	draw_set_valign(txt_valign);
	var _height=10;

	draw_text_ext_color(txt_posx+1,txt_posy,string_copy(txt,1,floor(txt_progress)),_height,txt_width,0,0,0,0,1);
	draw_text_ext_color(txt_posx+2,txt_posy,string_copy(txt,1,floor(txt_progress)),_height,txt_width,0,0,0,0,1);
	draw_text_ext_color(txt_posx-1,txt_posy,string_copy(txt,1,floor(txt_progress)),_height,txt_width,0,0,0,0,1);
	draw_text_ext_color(txt_posx-2,txt_posy,string_copy(txt,1,floor(txt_progress)),_height,txt_width,0,0,0,0,1);
	draw_text_ext_color(txt_posx,txt_posy+1,string_copy(txt,1,floor(txt_progress)),_height,txt_width,0,0,0,0,1);
	draw_text_ext_color(txt_posx,txt_posy-1,string_copy(txt,1,floor(txt_progress)),_height,txt_width,0,0,0,0,1);
	draw_text_ext_color(txt_posx+1,txt_posy+1,string_copy(txt,1,floor(txt_progress)),_height,txt_width,0,0,0,0,1);
	draw_text_ext_color(txt_posx-1,txt_posy-1,string_copy(txt,1,floor(txt_progress)),_height,txt_width,0,0,0,0,1);
	draw_text_ext_color(txt_posx-1,txt_posy+1,string_copy(txt,1,floor(txt_progress)),_height,txt_width,0,0,0,0,1);
	draw_text_ext_color(txt_posx+1,txt_posy-1,string_copy(txt,1,floor(txt_progress)),_height,txt_width,0,0,0,0,1);

	draw_text_ext_color(txt_posx,txt_posy,string_copy(txt,1,floor(txt_progress)),_height,txt_width,txt_color,txt_color,txt_color,txt_color,1);
	//draw_text(txt_posx,txt_posy,string_copy(txt,1,floor(txt_progress)));
	//draw_text_color_outline(txt_posx,txt_posy,txt,txt_color,1);
	if (mouse_check_button(mb_any) || global.action_held)
	{
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_dkgray,.5)
	}