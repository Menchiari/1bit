/// @description 

// Inherit the parent event
event_inherited();

trigger_spawn_idle_a=sit_idle_a;
trigger_spawn_idle_b=sit_idle_a;
trigger_spawn_a=sit_getup_a;
trigger_spawn_b=sit_getup_a;

dir=-1;
speech_distance=random_range(80,100);
trigger_distance=random_range(20,60);

awake=false;

ai_type=ai_types.ai_basic;
