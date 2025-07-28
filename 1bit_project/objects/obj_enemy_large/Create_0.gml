/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//ai_state=choose(ai_states.wander,ai_states.follow,ai_states.idle,ai_states.guard,ai_states.search,ai_states.flee);
//ai_state_original=ai_state;
//state=states.walk;
//control=controls.ai;

character_body=spr_hero_monster;

ai_state_original=ai_states.guard;
control=controls.ai;

//spawn event
state=states.spawn;
trigger_spawn_idle_a=126//block_a;
trigger_spawn_idle_b=126//block_b;
trigger_spawn_a=29//139//attack_a;
trigger_spawn_b=33//143//attack_b;
trigger_spawn=false;
trigger_distance=70;