/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if image_index==wakeup_ground_a {skin_color=c_white;}
else {skin_color=c_red;}

if instance_exists(obj_hero)
{
	if point_distance(x,y,obj_hero.x,obj_hero.y)<trigger_distance && trigger==false
	{
		trigger_spawn=true;
		if state==states.idle
		|| state==states.hit
		{
			control=controls.ai;
			ai_state=ai_states.idle;
			ai_state_original=ai_states.chase;
			trigger=true;
		}
	}
}