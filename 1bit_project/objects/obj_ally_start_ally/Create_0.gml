/// @description 

// Inherit the parent event
event_inherited();

//customize character
character_head=spr_head_beard;
state=states.spawn;
idle_speed=random_range(.1,.3)

//customize equipment
equip_weapon(global.weapons[15]);
equip_armor(global.armors[7]);
equip_helm(global.helms[0]);

//customize ai
control=controls.null;
faction=factions.ally;
ai_type=ai_types.ai_test;
ai_timer_attack1=20;
ai_timer_attack2=50;
ai_responsiveness=5;

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
speech_text_1="HOLD AND SWIPE\nTO SMASH\nTHAT DOOR";
speech_text_2="SHORT HOLD\nWILL BLOCK\nATTACKS";
speech_text_3="LONG HOLD\nWILL CHARGE\nYOUR ATTACK";
speech_text_4="ONCE YOU'RE OUT\nYOU'RE ON\nYOUR OWN";
speech_text_5="";
speech_distance=60;

//custom
sentence=0;