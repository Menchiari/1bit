/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

instance_create(obj_ui_mercenary);
state=states.spawn;
control=controls.null;

greet=collision_circle(x,y,10,obj_ui_greet,true,true)
if instance_exists(greet) {instance_destroy(greet)}