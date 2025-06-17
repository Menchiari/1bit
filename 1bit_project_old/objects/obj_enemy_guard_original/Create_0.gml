/// @description 
// Inherit the parent event
event_inherited();

//customize character
character_head=spr_head;
idle_a=idle_knife;
idle_b=idle_knife;
idle_speed=random_range(.05,.2)

//customize equipment
equip_weapon(global.weapons[22]);
equip_armor(global.armors[16]);
equip_helm(global.helms[19]);

//customize ai
ai_type=ai_types.ai_test;
ai_timer_attack1=20;
ai_timer_attack2=50;
ai_responsiveness=5;

//main stats
hp_max=2;
str=.4;
res=1;
spd=1.1;

//spawn event
state=states.spawn;
trigger_spawn_idle_a=block_a;
trigger_spawn_idle_b=block_b;
trigger_spawn_a=attack_a;
trigger_spawn_b=attack_b;
trigger_spawn=false;
trigger_distance=70;