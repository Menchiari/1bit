/// @description Insert description here
// You can write your code in this editor
var dist=5;
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,0,alpha);
draw_sprite_ext(sprite_index,image_index,x+1,y+dist,image_xscale,image_yscale,image_angle,0,alpha/2);
draw_sprite_ext(sprite_index,image_index,x+1,y-dist,image_xscale,image_yscale,image_angle,0,alpha/2);
draw_sprite_ext(sprite_index,image_index,x+dist,y-1,image_xscale,image_yscale,image_angle,0,alpha/2);
draw_sprite_ext(sprite_index,image_index,x-dist,y-1,image_xscale,image_yscale,image_angle,0,alpha/2);
