/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

skin_color=c_white;
blood_active=false;

character_head=choose(spr_head_skull);
character_body=choose(spr_body_skeleton);
idle_a=idle_zombiea;
idle_b=idle_zombieb;
idle_speed=random_range(.05,.2)

//customize ai
ai_type=ai_types.ai_zombie;
ai_timer_attack1=20;
ai_timer_attack2=50;
ai_responsiveness=1;

//spawn event
state=states.spawn;
trigger_spawn_idle_a=wakeup_ground_a;
trigger_spawn_idle_b=wakeup_ground_a;
trigger_spawn_a=wakeup_ground_a;
trigger_spawn_b=wakeup_ground_b;
trigger_spawn=false;
trigger_distance=30;

trigger=false;

//var spawn_frame=choose(death_1_b,death_1_b-1,death_3_b,death_3_b-1,death_3_b-2,idle_sita,idle_sitb,idle_sitc);
//trigger_spawn_idle_a=spawn_frame;
//trigger_spawn_idle_b=spawn_frame;
//trigger_spawn_a=sit_getup_a;
//trigger_spawn_b=sit_getup_b;
//trigger_distance=50;