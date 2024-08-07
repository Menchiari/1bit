/// @description 
// Inherit the parent event
event_inherited();

//customize character
sprite_skin=spr_hero_monster;
character_head=spr_head_infected;
idle_speed=random_range(.05,.2)

//customize equipment
equip_weapon(global.weapons[22]);
equip_armor(global.armors[22]);
equip_helm(global.helms[16]);

//customize ai
ai_type=ai_types.ai_test;
ai_timer_attack1=20;
ai_timer_attack2=50;
ai_responsiveness=10;

//main stats
hp_max=4;
str=1;
res=1;
size=1.2;

//spawn event
state=states.spawn;
trigger_spawn_idle_a=idle_sword;
trigger_spawn_idle_b=idle_sword;
trigger_spawn_a=attack_a;
trigger_spawn_b=attack_b;
trigger_spawn=false;
trigger_distance=150;