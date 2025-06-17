/// @description 

// Inherit the parent event
event_inherited();

//spawn event
var spawn_frame=choose(death_1_b,death_1_b-1,death_3_b,death_3_b-1,death_3_b-2,idle_sita,idle_sitb,idle_sitc);
trigger_spawn_idle_a=spawn_frame;
trigger_spawn_idle_b=spawn_frame;
trigger_spawn_a=sit_getup_a;
trigger_spawn_b=sit_getup_b;
trigger_distance=50;