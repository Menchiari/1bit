/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

ai_state=choose(ai_states.wander,ai_states.follow,ai_states.idle,ai_states.guard,ai_states.search,ai_states.flee);
ai_state_original=ai_state;
state=states.walk;
control=controls.ai;
character_head=choose(spr_head_beard,spr_head_beard,spr_head_beard,spr_head_old,spr_head_female1);
character_body=spr_hero_monster;