/// draw_sprite_shadow(sprite,image_index,x,y,xscale,yscale,xoffset,yoffset,shadow_alpha);
/// @param sprite
/// @param image_index
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param color
/// @param xoffset
/// @param yoffset
/// @param shadow_alpha

function draw_sprite_shadow(sprite,_image_index,_x,_y,xscale,yscale,color,xoffset,yoffset,shadow_alpha,shadow_border)
{
	draw_sprite_ext(sprite,_image_index,_x+xoffset,_y+yoffset,xscale,yscale,char_rot,c_black,shadow_alpha);
	if shadow_border!=0
	{
		var shadow_fade=8;
		draw_sprite_ext(sprite,_image_index,_x+(xoffset + shadow_border/2),_y+(yoffset + shadow_border/2),xscale,yscale,char_rot,c_black,shadow_alpha/shadow_fade);
		draw_sprite_ext(sprite,_image_index,_x+(xoffset + shadow_border/2),_y+(yoffset - shadow_border/2),xscale,yscale,char_rot,c_black,shadow_alpha/shadow_fade);
		draw_sprite_ext(sprite,_image_index,_x+(xoffset - shadow_border/2),_y+(yoffset + shadow_border/2),xscale,yscale,char_rot,c_black,shadow_alpha/shadow_fade);
		draw_sprite_ext(sprite,_image_index,_x+(xoffset - shadow_border/2),_y+(yoffset - shadow_border/2),xscale,yscale,0,c_black,shadow_alpha/shadow_fade);

		draw_sprite_ext(sprite,_image_index,_x							,_y+(yoffset + shadow_border/2),xscale,yscale,char_rot,c_black,shadow_alpha/shadow_fade);
		draw_sprite_ext(sprite,_image_index,_x							,_y+(yoffset - shadow_border/2),xscale,yscale,char_rot,c_black,shadow_alpha/shadow_fade);
		draw_sprite_ext(sprite,_image_index,_x+(xoffset + shadow_border/2),_y							 ,xscale,yscale,char_rot,c_black,shadow_alpha/shadow_fade);
		draw_sprite_ext(sprite,_image_index,_x+(xoffset - shadow_border/2),_y							 ,xscale,yscale,char_rot,c_black,shadow_alpha/shadow_fade);
}
	draw_sprite_ext(sprite,_image_index,_x,_y,xscale,yscale,char_rot,color,1);
}