/// @description draw black border to the sides
if active==true{
draw_sprite(sprite_index,image_index,x,y);
var bordx = (global_resx-sprite_width)
var bordy = (global_resy-sprite_height)
draw_rectangle_color(x-sprite_width/2,y-sprite_height/2,x-sprite_width/2-bordx,y+bordy+sprite_height/2,0,0,0,0,0);
draw_rectangle_color(x+sprite_width/2,y-sprite_height/2,x+sprite_width/2+bordx,y+bordy+sprite_height/2,0,0,0,0,0);
//draw_rectangle_color(x-(sprite_width/2)-bordx,y-sprite_height/2,x-sprite_width/2,y+sprite_height/2,0,0,0,0,0);
//draw_rectangle_color(x+sprite_width/2,y-sprite_height/2,x+sprite_width/2+bordx,y+sprite_height/2,0,0,0,0,0);
}