/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

control=controls.ai;
faction=factions.ally;
ai_state_original=ai_states.wander;

sprite_skin=spr_dog;
sprite_body=spr_dog;
sprite_back=spr_dog;
character_head=spr_null;
character_body=spr_null;

skin_color=c_white;
speech_color=c_white;

ai_type=ai_types.ai_test;
ai_responsiveness=animset_atk2_time

name="dog"

equip_armor(global.armors[0]);
equip_weapon(global.weapons[0]);
equip_helm(global.helms[0]);

	idle_a=0;
	idle_b=0;
	idle_speed=.25;//image_speed on idle
	walk_a=1;
	walk_b=7;
	run_a=8;
	run_b=11;
	block_a=12;
	block_b=13;
	breathe_a=0;
	breathe_b=0;
	jump_a=14;
	jump_b=17;
	
	attack_charge1_a=12;//preparation frame normal attack
	attack_charge1_b=13;//preparation frame strong attack
	attack_1_a=14;//first frame of attack
	attack_1_b=17;//last frame of attack
	attack_1_fr=15;//attack frame
	attack_charge2_a=12;
	attack_charge2_b=13;
	attack_2_a=14;
	attack_2_b=17;
	attack_2_fr=15;
	attack_charge3_a=12;
	attack_charge3_b=13;
	attack_3_a=14;
	attack_3_b=17;
	attack_3_fr=15;
	attack_charge_shotgun_a=161;
	attack_charge_shotgun_b=162;
	attack_shotgun_a=163;
	attack_shotgun_b=170;
	attack_shotgun_fr=164;
		
	block_hit_a=18;
	block_hit_b=21;
	idle_hit_a=18;
	idle_hit_b=21;
	death_1_a=22;
	death_1_b=29;
	death_2_a=22;
	death_2_b=29;
	death_3_a=22;
	death_3_b=29;
	
	attack_charge_op_a=12;
	attack_charge_op_b=13;
	attack_op_a=14;
	attack_op_b=17;
	attack_op_fr=15;
	
	//idle 
	idle_knife=0;
	idle_fight=0;
	idle_sword=0;
	idle_stick=0;
	idle_katana=0;
	idle_shotgun=0;
	
	idle_floater=0;
	idle_zombiea=0;
	idle_zombieb=0;
	
	idle_sita=0;
	idle_sitb=0;
	idle_sitc=0;
	
	//from 120 to 127 is different idles
	wakeup_a=1;
	wakeup_b=3;
	sit_a=0;
	sit_b=0;
	sit_idle_a=0;
	sit_idle_b=0;
	sit_getup_a=0;
	sit_getup_b=0;
	wakeup_ground_a=1;
	wakeup_ground_b=3;
	
	attack_charge=12;
	attack_charge_strong=13;