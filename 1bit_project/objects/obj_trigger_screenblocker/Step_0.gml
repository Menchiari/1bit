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

if alpha<alpha_min alpha=alpha_min;
if alpha>alpha_max alpha=alpha_max;