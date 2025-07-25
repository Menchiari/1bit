/// @description

// Inherit the parent event
//event_inherited();

draw_rectangle_color(0,0,200,320,0,0,0,0,false)
draw_set_font(fnt_dialogue);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_ext(x+20,y+20,string_copy(txt,1,floor(txt_progress)),10,140);