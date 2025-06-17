/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if instance_exists(obj_hero)
{
	if point_distance(x,y,obj_hero.x,obj_hero.y)<trigger_distance {trigger_spawn=true;}
}