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
if global.deathcount==3 {speech_text="you have\nno idea..."}
if global.deathcount==4 {speech_text="slay me to\nfind out"}
if global.deathcount==5 {speech_text="The perfection of the few\nis built on the\nsuffering of the many"}
if global.deathcount==7 {speech_text="That's the only reason\nyou even exist at all"}
if global.deathcount==8 {speech_text="thought you could\nlive forever?"}
if global.deathcount>=9 {speech_text=string(global.deathcount-16)+" deaths left"}
if global.deathcount==15 {speech_text="ready to die?"}

if (global.deathcount==3
|| global.deathcount==4
|| global.deathcount==5
|| global.deathcount==7
|| global.deathcount==8)
&& (object_index==obj_death_hp
|| object_index==obj_death_res
|| object_index==obj_death_spd
|| object_index==obj_death_str)
{activate=false; instance_destroy();}

speech_color=c_red;
speech_distance=30;
dialogue_death_chance=0;

//custom
sentence=0;
activate=true;