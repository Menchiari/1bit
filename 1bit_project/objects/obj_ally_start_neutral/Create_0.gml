/// @description 

// Inherit the parent event
event_inherited();

//customize character
character_head=spr_head_infected;
state=states.spawn;
idle_speed=random_range(.1,.3)

//customize equipment
equip_weapon(global.weapons[17]);
equip_armor(global.armors[0]);
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
trigger_spawn_idle_a=95;
trigger_spawn_idle_b=102;
trigger_spawn_a=sit_getup_a;
trigger_spawn_b=sit_getup_b;
trigger_spawn=false;
trigger_distance=200;

speech_text="";
speech_text_0="...";
speech_text_1="They took from you\nthe one thing that\nmattered the most";
speech_text_2="";
speech_text_3="you will never make\nit out of here alive";
speech_text_4="";
speech_text_5="...";
speech_color=c_red;
speech_distance=60;
speech_without_enemies=true;

//custom
sentence=0;