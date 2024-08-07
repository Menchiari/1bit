/// @description 
draw_sprite(sprite_index,0,x,y);

draw_set_font(fnt_dialogue);
draw_set_halign(fa_center);
draw_set_valign(fa_top);


//draw text about name

draw_text(x+(sprite_width/2),y+2,"strength: "+string(strength1)+"/"+string(strength2));
draw_text(x+(sprite_width/2),y+10,"resistance: "+string(resistance));
draw_text(x+round(sprite_width/2),y+18,"weight: +"+string(weight)+"kg");
//draw text about age
//draw stats