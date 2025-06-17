// Inherit the parent event obj_enemy
event_inherited();

//customize character
character_head=choose(spr_head,spr_head_female1);
state=states.spawn;
idle_speed=random_range(.05,.2)

//customize equipment
equip_weapon(global.weapons[irandom_range(0,49)]);
equip_armor(global.armors[irandom_range(0,31)]);
equip_helm(global.helms[irandom_range(0,31)]);

//customize ai
control=controls.ai;
faction=factions.ally;
ai_type=ai_types.ai_test;
ai_timer_attack1=20;
ai_timer_attack2=50;
ai_responsiveness=5;
ai_state_original=ai_states.follow;

//main stats
hp_max=1;
str=1;
res=1;

//spawn event
state=states.spawn;
trigger_spawn_idle_a=sit_idle_a;
trigger_spawn_idle_b=sit_idle_b;
trigger_spawn_a=sit_getup_a;
trigger_spawn_b=sit_getup_b;
trigger_spawn=false;
trigger_distance=40;

speech_text="";
speech_distance=50;