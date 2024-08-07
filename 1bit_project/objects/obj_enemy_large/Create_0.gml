/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

ai_state=choose(ai_states.wander,ai_states.follow,ai_states.idle,ai_states.guard,ai_states.search,ai_states.flee);
ai_state_original=ai_state;
state=states.walk;
control=controls.ai;
character_body=spr_hero_monster;