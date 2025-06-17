// Inherit the parent event
event_inherited();

//UI
if state!=states.spawn
{
	var hp_height=-5;
	var hp_length=4.5/hp_max;
	draw_line_color(x-(hp*hp_length)-1,y-hp_height,x+(hp*hp_length)+1,y-hp_height,0,0);
	draw_line_color(x-hp*hp_length,y-hp_height-1,x+hp*hp_length,y-hp_height-1,0,0);
	draw_line_color(x-hp*hp_length,y-hp_height+1,x+hp*hp_length,y-hp_height+1,0,0);
	draw_line_color(x-hp*hp_length,y-hp_height,x+hp*hp_length,y-hp_height,c_white,c_white);
}