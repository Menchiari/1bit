/// @description 

// Inherit the parent event
event_inherited();

//customize character
character_head=spr_head_beard;
state=states.spawn;
idle_speed=random_range(.1,.3)

//customize equipment
equip_weapon(global.weapons[5]);
equip_armor(global.armors[2]);
equip_helm(global.helms[0]);

//customize ai
control=controls.null;
faction=factions.neutral;
ai_type=ai_types.ai_test;
ai_timer_attack1=20;
ai_timer_attack2=50;
ai_responsiveness=5;

//main stats
hp_max=.2;
str=10;
res=.5;

//spawn event
state=states.spawn;
trigger_spawn_idle_a=0;
trigger_spawn_idle_b=0;
trigger_spawn_a=sit_getup_a;
trigger_spawn_b=sit_getup_b;
trigger_spawn=false;
trigger_distance=40;

speech_text="";
speech_color=c_white;
speech_distance=50;

//custom
sentence=0;