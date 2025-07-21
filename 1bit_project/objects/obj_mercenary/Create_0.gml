/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if start_following==true
{
	ai_state_original=ai_states.follow;
	ai_state=ai_states.follow;
	state=states.idle;
	control=controls.ai;
	faction=factions.ally;
}
else
{
	instance_create(obj_ui_mercenary);
	state=states.spawn;
	control=controls.null;
}
//greet=collision_circle(x,y,12,obj_ui_greet,true,true)
//if instance_exists(greet) {instance_destroy(greet)}