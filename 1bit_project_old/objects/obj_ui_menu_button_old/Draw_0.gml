//draw_rectangle_color(x,y,sprite_width,sprite_height,c_white,c_white,c_white,c_white,true);
draw_sprite(sprite_index,image_index,x,y);
//draw_line_color(x+lineax1,y,x+lineax2,sprite_height,c_black,c_black);
//draw_line_color(x+linebx1,y,x+linebx2,sprite_height,c_black,c_black);
//draw_line_color(x+linecx1,y,x+linecx2,sprite_height,c_black,c_black);

draw_set_font(fnt_dialogue);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_color(x+sprite_width/2,y+(sprite_height/2)-1,text,color,color,color,color,alpha);