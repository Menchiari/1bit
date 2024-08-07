/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if instance_exists(shop)
{
	shop.x=x;
	shop.y=y;
}

if state==states.hit
{
	instance_destroy(shop);
	faction=factions.enemy;
	control=controls.ai;
}

if faction!=factions.enemy
{
	if instance_exists(obj_hero)
	{
		if point_distance(x,y,obj_hero.x,obj_hero.y)<30
		{
			ai_state=ai_states.null;
			state=states.spawn;
			speed=0;
			control=controls.null;
		}
		else
		{
			ai_state=ai_states.wander;
			state=states.walk;
			control=controls.ai;
		}
	}
}