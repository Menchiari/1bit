/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_dialogue);

draw_text_color_outline(x,y,death_quote,c_red,1);
draw_text_color_outline(x,y+10,death_quote1,c_red,1);
draw_text_color_outline(x,y-15,string(round(death_timer/30)+1)+"...",c_white,1);
