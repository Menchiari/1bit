/// @description spawn
var spawned_npc=spawn_npc_test(x,y,character_type,global.NPCs);
spawned_npc.drop_rate=drop_rate_override //spawned_npc.drop_rate*drop_rate_multiplier;
spawned_npc.hp_max=spawned_npc.hp_max*alive
spawned_npc.dialogue_death=dialogue_death_var;

if override_ai==true
{
	spawned_npc.ai_state_original=ai_state_var;
	spawned_npc.ai_state=ai_state_var;
}