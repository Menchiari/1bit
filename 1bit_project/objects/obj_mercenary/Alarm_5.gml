/// @description spawn ui
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

show_debug_message(string(id.name)+" mercenary created. Following = "+string(start_following));