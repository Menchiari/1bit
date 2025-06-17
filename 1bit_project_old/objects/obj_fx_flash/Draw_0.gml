if flash=true
{
	draw_set_alpha(1);
	draw_rectangle_color(0,0,room_width,room_height,c_white,c_white,c_white,c_white,false);
	draw_set_alpha(image_alpha);
	draw_sprite_ext(sprite_index,flash_index,flash_x,flash_y,flash_dir,1,rot,c_black,1);
}
else
{
	draw_sprite(spr_null,0,x,y);
}