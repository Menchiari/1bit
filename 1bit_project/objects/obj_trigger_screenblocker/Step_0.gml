/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,obj_hero)
{
	alpha-=fadein_speed;
}
else
{
	alpha+=fadeout_speed;
}

if alpha<0 alpha=0;
if alpha>1 alpha=1;

depth=global.depth_ui+10;