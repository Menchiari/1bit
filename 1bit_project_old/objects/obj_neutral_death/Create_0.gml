/// @description 

// Inherit the parent event
event_inherited();

//customize character
character_head=spr_head_infected;
state=states.spawn;
idle_speed=random_range(.1,.3)

//customize equipment
equip_weapon(global.weapons[0]);
equip_armor(global.armors[2]);
equip_helm(global.helms[9]);

//customize ai
control=controls.null;
faction=factions.neutral;
ai_type=ai_types.ai_test;
ai_timer_attack1=20;
ai_timer_attack2=50;
ai_responsiveness=5;

//main stats
hp_max=.02;
str=100;
res=.05;

//spawn event
state=states.spawn;
trigger_spawn_idle_a=95;//idle_floater
trigger_spawn_idle_b=102;//idle_floater
trigger_spawn_a=sit_getup_a;
trigger_spawn_b=sit_getup_b;
trigger_spawn=false;
trigger_distance=40;

speech_text="slay me to\nreawaken";
speech_color=c_red;
speech_distance=30;

//custom
sentence=0;
activate=true;