/// @description 
draw_sprite(sprite_index,0,x,y);

draw_set_font(fnt_dialogue);
draw_set_halign(fa_center);
draw_set_valign(fa_top);


//draw text about name

draw_text(x+(sprite_width/2),y,"strength: "+string_format(strength1,0,1)+"/"+string_format(strength2,0,1));
draw_text(x+(sprite_width/2),y+7,"resistance: "+string_format(resistance,0,1));
draw_text(x+round(sprite_width/2),y+14,"weight: +"+string_format(weight,0,0)+"kg");
draw_text(x+round(sprite_width/2),y+21,"speed: "+string_format(herospeed,0,1));
//draw text about age
//draw stats