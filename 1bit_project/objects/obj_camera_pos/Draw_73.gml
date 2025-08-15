/// @description draw black border to the sides
if active==true{
draw_sprite(sprite_index,image_index,x,y);
var bordx = (global_resx-cam_width)
var bordy = (global_resy-cam_height)
draw_rectangle_color(x-cam_width/2,y-cam_height/2,x-cam_width/2-bordx,y+bordy+cam_height/2,0,0,0,0,0);
draw_rectangle_color(x+cam_width/2,y-cam_height/2,x+cam_width/2+bordx,y+bordy+cam_height/2,0,0,0,0,0);
//draw_rectangle_color(x-(cam_width/2)-bordx,y-cam_height/2,x-cam_width/2,y+cam_height/2,0,0,0,0,0);
//draw_rectangle_color(x+cam_width/2,y-cam_height/2,x+cam_width/2+bordx,y+cam_height/2,0,0,0,0,0);
}
if no_ui==true
{
	sprite_index=spr_camera_port_invisible;
}