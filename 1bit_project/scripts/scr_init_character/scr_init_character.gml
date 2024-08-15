function scr_init_character(){

	control=controls.keyboard;
	state=states.idle;

#region initialize character sprites
	character_head=spr_head;//choose(spr_head,spr_head_female1,spr_head_beard,spr_head_infected);//choose(spr_head,spr_head_infected,spr_head_skull);
	character_body=spr_body_naked;
	skin_color=c_white//make_color_rgb(247,209,192);
	sprite_skin=spr_hero;
	sprite_body=spr_hero;
	sprite_back=spr_hero_back;
	sprite_light=spr_null;
	sprite_shadow=spr_shadow;
	
	dialogue_variation=false;
	dialogue_positive="";
	dialogue_neutral="";
	dialogue_negative="";
	death_description="";
	speech_text=choose(dialogue_positive,dialogue_neutral,dialogue_negative)//"";
	speech_visible=false;
	speech_verbose=false;//extended speech especially in AI states
	speech_distance=50;
	speech_color=c_white;
	speech_color_bk=c_black;
#endregion
#region animation frames
	idle_a=0;
	idle_b=0;
	idle_speed=.25;//image_speed on idle
	walk_a=1;
	walk_b=6;
	run_a=7;
	run_b=10;
	block_a=11;
	block_b=11;
	breathe_a=12;
	breathe_b=21;
	jump_a=22;
	jump_b=32;
	
	attack_charge1_a=37;//preparation frame normal attack
	attack_charge1_b=36;//preparation frame strong attack
	attack_1_a=33;//first frame of attack
	attack_1_b=40;//last frame of attack
	attack_1_fr=34;//attack frame
	attack_charge2_a=40;
	attack_charge2_b=47;
	attack_2_a=40;
	attack_2_b=51;
	attack_2_fr=43;
	attack_charge3_a=54;
	attack_charge3_b=49;
	attack_3_a=50;
	attack_3_b=55;
	attack_3_fr=51;
	attack_charge_shotgun_a=161;
	attack_charge_shotgun_b=162;
	attack_shotgun_a=163;
	attack_shotgun_b=170;
	attack_shotgun_fr=164;
		
	block_hit_a=55;
	block_hit_b=58;
	idle_hit_a=59;
	idle_hit_b=65;
	death_1_a=66;
	death_1_b=76;
	death_2_a=77;
	death_2_b=86;
	death_3_a=86;
	death_3_b=105;
	
	attack_charge_op_a=106;
	attack_charge_op_b=107;
	attack_op_a=108;
	attack_op_b=115;
	attack_op_fr=110;
	
	//idle 
	idle_knife=116;
	idle_fight=120;
	idle_sword=117;
	idle_stick=118;
	idle_katana=119;
	idle_shotgun=160;
	
	idle_floater=121;
	idle_zombiea=122;
	idle_zombieb=123;
	
	idle_sita=125;
	idle_sitb=126;
	idle_sitc=127;
	
	//from 120 to 127 is different idles
	wakeup_a=128;
	wakeup_b=131;
	sit_a=132;
	sit_b=137;
	sit_idle_a=138;
	sit_idle_b=138;
	sit_getup_a=138;
	sit_getup_b=142;
	wakeup_ground_a=143;
	wakeup_ground_b=159;
#endregion
#region spawning variables
	trigger_spawn_idle_a=sit_idle_b;
	trigger_spawn_idle_b=sit_idle_b;//sit_idle_a;
	trigger_spawn_a=sit_getup_a;
	trigger_spawn_b=sit_getup_b;
	trigger_spawn=true;
	trigger_distance=150;
#endregion	
#region movement and combat variables
	lastplacex=x;
	lastplacey=y;
	dest_x=x;
	dest_y=y;
	click_x=x;
	click_y=y;
	run_distance_enemy=50;//range to check for always-run if enemy is around
	run_distance_min=run_distance_enemy-1//28;//distance before character runs instead of walking (uses same as enemy finder)
	run_distance=run_distance_min;
	swipe_threshold=10;
	mouse_pressed=false;
	timer=0;
	roll_time=8//5;
	atk1_time=15;//todo these frames are redefined in weapons
	atk2_time=40;//todo these frames are redefined in weapons
	
	blocking=false;
	blocking_timer=40;
	
	counter_time=atk1_time;//frames to counter while blocking //todo:fix

	back=false;
	dir=1;
	size=1;
	char_rot=global.orientation;
	
	walk_sp=.75//.75;
	run_sp=1.5//1.5;
	max_sp=5;
	roll_sp=2.95//2.75;
	idle_sp_decrease=.25;
	roll_sp_decrease=.02//.025; //speed of decreasing
	block_sp_decrease=.1; //also used for being hit
	
	//walking path
	walking_path = path_add();

#endregion	
#region attack variables
	attack_range=15;
	attack_range_strong=20;
	atk1_sp=5;
	atk1_sp_decrease=.3;
	atk2_sp=6;	
	atk2_sp_decrease=.4;
	//weapon.atk_dmg_light=1.5;
	//weapon.atk_dmg_strong=2;
	//weapon.atk_dmg_variation=.2;//added to the attack
	atk_push_speed_divider=3;
	weapon_image_speed=1;
	//weapon.weight=1;//weight of the weapon in kg
	//weapon.weapon_animset=weapons_animset.dagger;
	//weapon.bullets=0;
	weapon_sprite=spr_ui_weapons;
	
	attack_charge=attack_charge1_a;
	attack_charge_strong=attack_charge1_b;
	attack_a=attack_1_a;
	attack_b=attack_1_b;
	attack_fr=attack_1_fr;

#endregion
#region defense variables
	//armor.defence=1;		//resistance multiplier for armor
	//helm.defence=1;			//resistance multiplier for helm
	//helm.weight=0;	//weight of the helm in kg
	//armor.weight=0;	//weight of the armor in kg
	defence_speed=1;		//speed multiplier (.6 is slowest, 1 is weightless) 1kb equals -.01x;
	
	//stamina=10;
	hp_max=random_range(1,3);
	res=random_range(.75,1.5);
	str=random_range(.75,1.5);;
	spd=random_range(.75,1.5);;//random_range(.75,1.5);
	cha=1;
	charisma=cha;
	name="random human";
	
	walk_sp_mod=1;
	
	//these values are reset in character alarm[0]
	hp=hp_max;
	hp_min=hp_max/4;
	hp_recharge_default=.0025;
	hp_recharge=hp_recharge_default; //how much hp recharge per second
		
	main_color=c_white;
	blood_active=true;
	wait_spawn_time=room_speed*5;
#endregion
#region balancing stats
	faction=factions.neutral;
	drop_rate=global.drop_rate;
	weapon = new weapon_struct("init",0,0,0,0,0,0,0,0,"init",0);
	armor = new armor_struct("init",0,0,0,0,0,"init",0);
	helm =  new helm_struct("init",0,0,0,0,0,"init",0);
	atk_spd = 1;
	equip_weapon(choose(global.weapons[22],global.weapons[32],global.weapons[15],global.weapons[44]));
	equip_armor(choose(global.armors[0],choose(global.armors[25],global.armors[0],global.armors[16],global.armors[2],global.armors[22],global.armors[7],global.armors[2])));
	equip_helm(choose(global.helms[0],global.helms[0],global.helms[0],choose(global.helms[0],global.helms[21],global.helms[16],global.helms[19],global.helms[24])));
#endregion
#region A.I.
	ai_timer_attack=0;//defined in idle
	ai_state=ai_states.guard; //choose(ai_states.idle,ai_states.guard,ai_states.wander,ai_states.patrol);//ai_states.idle//choose(ai_states.idle,ai_states.guard,ai_states.wander,ai_states.patrol);
	ai_state_original=ai_state;
	ai_type=ai_types.ai_test;
	ai_timer_attack1=40;
	ai_timer_attack2=50;
	ai_responsiveness=4;
	ai_target=obj_character;
	ai_search_range=60//80;
	ai_guard_x=x;
	ai_guard_y=y;
	ai_patrol_x=x+random_range(-150,150);
	ai_patrol_y=y+random_range(-150,150);
	if instance_exists(obj_patrol_node)
	{
		var patrol_node=instance_nearest(x,y,obj_patrol_node);
		ai_patrol_x=patrol_node.x;
		ai_patrol_y=patrol_node.y;
	}
	ai_target_x=x;
	ai_target_y=y;
	ai_follow_target=obj_hero;
	ai_trigger_check=false;
#endregion
#region collisions
	path=path_add();
	path_active=true;
	mp_potential_settings(75,30,10,true);
	collision_check=false;
	collision_check_time=2;
	collision_check_x=x;
	collision_check_y=y;
	player_radius=5;
#endregion
#region other
	//XP
	xp=0;

	//weapon.name="";
	//armor.name="";
	//helm.name="";

	invincible=false;
	invincibility_timer=3;
	melee_atk_buffer=0;
	melee_atk_buffer_index=0;
	melee_atk_buffer_br=0;
	melee_atk_buffer_index_br=0;
	animation_speed_default=.25;
	
	terrain=terrains.stone;	

	//setup
	alarm[0]=1;//refresh main variables
	alarm[1]=collision_check_time;
#endregion
}