/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

var color = draw_get_color();

draw_set_color(c_white);
draw_circle(x,y,r,1);
draw_circle(x,y,14,1);
draw_circle(x,y,11,1);

for (var i = 0; i < 6; i++;)
{
	try
	{
		target_dir[i] = point_direction(x,y,target[i].x,target[i].y);
		target_dist[i] = distance_to_object(target[i]);
		var d = round( (target_dist[i]/max_distance)* (sprite_get_number(spr_compass_arrow)-1) )
		var t = target_dir[i];
		draw_sprite_ext(spr_compass_arrow,d,x+1,y+1,1,1,t,c_grey,1);
		draw_sprite_ext(spr_compass_arrow,d,x,y,1,1,t,c_white,1);
	}
	catch(e){}
}

draw_set_color(c_gray);
draw_circle(x,y,r+1,1);
draw_circle(x,y,13,1);
draw_circle(x,y,10,1);

draw_set_color(color);