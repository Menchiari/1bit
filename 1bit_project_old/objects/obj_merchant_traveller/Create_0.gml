/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var randomization=(choose(-20+random_range(-10,10),20+random_range(-10,10)))
shop=instance_create_depth(x+randomization,y,-y,obj_ui_shop);

ai_state_original=ai_states.idle;
control=controls.null;
state=states.spawn;

greet=collision_circle(x,y,10,obj_ui_greet,true,true)
if instance_exists(greet) {instance_destroy(greet)}