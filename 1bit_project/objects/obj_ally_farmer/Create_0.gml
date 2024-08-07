/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

ai_state_original=ai_states.guard;
control=controls.ai;
instance_create(obj_asset_farm);
var dialogue=instance_create(obj_ui_dialogue);
with dialogue
{
	dialogue_positive="Hi there! Take a look\nat my lovely crops";
	dialogue_neutral="...";
	dialogue_negative="Stay away from my farm";
}