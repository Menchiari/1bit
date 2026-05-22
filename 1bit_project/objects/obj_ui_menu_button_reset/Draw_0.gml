draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

// gamepad highlight
if (global.using_gamepad && variable_global_exists("deletesave_cursor") && global.deletesave_cursor == 1)
{
	draw_rectangle(x-1, y-1, x+sprite_width+1, y+sprite_height+1, true);
}