/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if !instance_exists(table)
|| state==states.hit
{
	instance_destroy(shop);
	faction=factions.enemy;
	control=controls.ai;
}