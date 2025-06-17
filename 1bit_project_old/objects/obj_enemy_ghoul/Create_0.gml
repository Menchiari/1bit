/// @description 
// Inherit the parent event
event_inherited();

//customize character
character_head=choose(spr_head,spr_head_infected,spr_head_infected,spr_head_infected,spr_head_infected);
character_body=choose(spr_body_infected,spr_body_naked_zombie,spr_body_naked);
idle_a=idle_zombiea;
idle_b=idle_zombieb;
idle_speed=random_range(.05,.2)

//customize equipment
equip_weapon(global.weapons[15]);
equip_armor(global.armors[0]);
equip_helm(global.helms[0]);

//customize ai
ai_type=ai_types.ai_test;
ai_timer_attack1=50;
ai_timer_attack2=50;
ai_responsiveness=10;

//main stats
hp_max=1.5;
str=.75;
res=1;
spd=1.5;

//spawn event
state=states.spawn;
trigger_spawn_idle_a=wakeup_ground_a;
trigger_spawn_idle_b=wakeup_ground_a;
trigger_spawn_a=wakeup_ground_a;
trigger_spawn_b=wakeup_ground_b;
trigger_spawn=false;
trigger_distance=40;