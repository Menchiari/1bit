//make hero more visible
	draw_sprite_shadow(spr_hero_shadow,image_index,x,y-1,dir*size,1*size,c_black,0,0,1,1);

	//draw_sprite_ext(spr_hero_shadow,image_index,x-1,y,dir*size,1*size,char_rot,c_red,1);
	//draw_sprite_ext(spr_hero_shadow,image_index,x,y-1,dir*size,1*size,char_rot,c_red,.75);
	//draw_sprite_ext(spr_hero_shadow,image_index,x,y-1,dir*size,1*size,char_rot,c_red,.75);
	//draw_sprite_ext(spr_hero_shadow,image_index,x+1,y,dir*size,1*size,char_rot,c_red,1);

//inherited event
	event_inherited();

//Attack Circle
	if state=states.block
	{
		range_a=(attack_range+(atk1_sp))*1.5;
		range_b=(attack_range_strong+(atk2_sp))*1.5;
		circle_color=c_maroon;
		parallax=1.5;
		if round(timer)==atk2_time
		{draw_ellipse_color(x-range_b,y-range_b/parallax,x+range_b,y+range_b/parallax,circle_color,circle_color,true);}
		else if round(timer)==atk1_time
		{circle_color=c_white;draw_ellipse_color(x-range_a,y-range_a/parallax,x+range_a,y+range_a/parallax,circle_color,circle_color,true);}
	}
	
//HP
var hp_height=-5;
var hp_length=4.5/hp_max;
draw_line_color(x-(hp*hp_length)-1,y-hp_height,x+(hp*hp_length)+1,y-hp_height,0,0);
draw_line_color(x-hp*hp_length,y-hp_height-1,x+hp*hp_length,y-hp_height-1,0,0);
draw_line_color(x-hp*hp_length,y-hp_height+1,x+hp*hp_length,y-hp_height+1,0,0);
draw_line_color(x-hp*hp_length,y-hp_height,x+hp*hp_length,y-hp_height,c_white,c_white);

//invincibility color
	//if invincible && state!=states.roll 
	//{draw_sprite_ext(sprite_back,image_index,x,y,dir*size,1*size,char_rot,choose(color,c_black),1);}

//debug stuff here:
	//draw_line_color(x,y,dest_x,dest_y,c_white,c_white);
	//draw_circle_color(dest_x,dest_y,5,c_white,c_white,true)