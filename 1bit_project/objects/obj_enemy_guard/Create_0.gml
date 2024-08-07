/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

ai_state_original=ai_states.guard;
control=controls.ai;

//spawn event
state=states.spawn;
trigger_spawn_idle_a=block_a;
trigger_spawn_idle_b=block_b;
trigger_spawn_a=attack_a;
trigger_spawn_b=attack_b;
trigger_spawn=false;
trigger_distance=70;