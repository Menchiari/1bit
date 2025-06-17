/// @description 
// Inherit the parent event
event_inherited();

//customize character
sprite_skin=spr_hero;
character_head=spr_head_skull;
idle_speed=random_range(.05,.2)

//customize equipment
equip_weapon(global.weapons[22]);
equip_armor(global.armors[25]);
equip_helm(global.helms[26]);

//customize ai
ai_type=ai_types.ai_aggressive;
ai_timer_attack1=atk1_time+2;
ai_timer_attack2=atk2_time+4;
ai_responsiveness=10;

//main stats
hp_max=3;
str=.75;
res=1;
spd=1.25;
size=1.1;

//spawn event
state=states.spawn;
trigger_spawn_idle_a=idle_sword;
trigger_spawn_idle_b=idle_sword;
trigger_spawn_a=attack_a;
trigger_spawn_b=attack_b;
trigger_spawn=false;
trigger_distance=90;