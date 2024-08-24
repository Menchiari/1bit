/// @description Dialogue Options
event_inherited();

speech_text_1=sp1;
speech_text_2=sp2;
speech_text_3=sp3;
speech_text_4=sp4;
speech_text_5=sp5;
speech_text_6=sp6;
speech_text_7=sp7;
speech_text_8=sp8;
speech_distance=rng6;

//customize character
character_head=spr_head_infected;
state=states.spawn;
idle_speed=.05

//customize equipment
equip_weapon(global.weapons[0]);
equip_armor(global.armors[2]);
equip_helm(global.helms[9]);

//spawn event
trigger_spawn_idle_a=95;//idle_floater
trigger_spawn_idle_b=102;//idle_floater
trigger_spawn_a=sit_getup_a;
trigger_spawn_b=sit_getup_b;
trigger_spawn=false;

speech_color=c_red;