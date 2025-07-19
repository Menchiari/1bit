/// @description torch only

if place_meeting(x,y,obj_hero)
&& instance_exists(obj_torch)
{
	alpha-=fadein_speed;
}
else
{
	alpha+=fadeout_speed;
}

if alpha<alpha_min alpha=alpha_min;
if alpha>alpha_max alpha=alpha_max;
//event_inherited(); // Inherit the parent event

