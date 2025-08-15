function init_enums(){
	#region enums
//enums
	enum controls
	{
		null,
		keyboard,
		gamepad,
		touch,
		ai
	}
	enum states
	{
		null,
		spawn,
		idle,
		walk,
		run,
		block,
		breathe,
		roll,
		attack,
		attack_strong,
		block_hit,
		hit,
		collide_hit,
		sit,
		sit_idle,
		death
	}
	enum ai_types
	{
		ai_test,
		ai_basic,
		ai_zombie,
		ai_aggressive
	}
	enum ai_states
	{
		idle,
		wander,
		follow,
		guard,
		patrol,
		alert,
		aware,
		chase,
		search,
		fight,
		flee,
		null
	}
	enum factions
	{
		ally,
		enemy,
		neutral,
		zombie,
		everyone
	}
	enum armors
	{
		angel,
		naked,
		chainmail,
		crusader,
		infected,
		metal,
		pelt,
		skeleton,
		vest,
		metal_extreme,
		cape,
		null
	}
	enum helms
	{
		head,
		bishop,
		roman,
		rusty,
		small1,
		small2,
		strayhat1,
		hood,
		null
	}
	enum weapons
	{
		hands,
		dagger,
		sword,
		stick,
		katana,
		katana_extreme,
		shotgun,
		null
	}
	enum weapons_animset
	{
		hands,
		dagger,
		sword,
		stick,
		katana,
		shotgun,
		null
	}
	enum armors_material
	{
		flesh,
		cloth,
		leather,
		cape,
		ceramic,
		chainmail,
		metal_thin,
		metal_thick,
		wood,
		null
	}
	enum terrains
	{
		wood,
		wood_wet,
		stone,
		stone_wet,
		mud,
		blood
	}
	#endregion
}

function init_globals(){
	#region GLOBAL VARIABLES
	
//setup
	global.control_type=controls.gamepad;//probably unused? todo check and fix

	global.depth_ui_front=-8000;
	global.depth_ui_shop=-7000;
	global.depth_ui_text=-6000;
	global.depth_ui=-5000;
	global.depth_floor=0;
	global.room_speed_default=24;
	global.gamma_default=1;
	game_set_speed(global.room_speed_default,gamespeed_fps);//room_speed=global.room_speed_default;
	global.shader=shd_1bit_blood;
	// Global Resolution:
	// For border change the resolution in room rm_setup, obj_camera_pos, obj_camera, obj_hero
	global.res_x=200//180//280;//220;
	global.res_y=320//400;//380;

	global.blood_color=c_orange;//c_fuchsia;//c_red;

	global.orientation=0;// 0=portrait, 90=landscape; //deprecated

	global.slot=0;
	global.chosen_room=rm_start;
	
//random seed
	//ini_open("random.seed")
	//default_seed=current_second+current_hour+current_day+current_year;
	//global.current_seed=ini_read_real("RANDOM","SEED",default_seed);
	//ini_write_real("RANDOM","SEED",global.current_seed);
	//ini_close();
	scr_randomize();
	
//rooms
	global.allrooms=false;
	global.room_list=ds_list_create();
	ds_list_clear(global.room_list);
	ds_list_add(global.room_list,rm_prison_guard_large);
	ds_list_shuffle(global.room_list);

	global.room_list_a=ds_list_create();
	ds_list_clear(global.room_list_a);
	ds_list_add(global.room_list_a,rm_prison_guard);
	ds_list_shuffle(global.room_list_a);
	global.room_list_b=ds_list_create();
	ds_list_clear(global.room_list_b);
	ds_list_add(global.room_list_b,rm_dungeon,rm_dungeon_skeletons);
	ds_list_shuffle(global.room_list_b);
	global.room_list_c=ds_list_create();
	ds_list_clear(global.room_list_c);
	ds_list_add(global.room_list_c,rm_dungeon_fall,rm_reflection,rm_castle,rm_chess,rm_mirror,rm_forest,rm_forest2);
	ds_list_shuffle(global.room_list_c);
#endregion
#region player balancing
	
//csv import
	scr_balancing_helm();
	scr_balancing_armor();
	scr_balancing_weapon();
	
	
	csv_npc_import();
	
	csv_level_import("CSV 1Bit Elements - Level Chart.csv");
	csv_decor_import("CSV 1Bit Elements - Background Sprites.csv")
	
	global.player_skin=spr_hero;
	global.player_head=choose(spr_head_female,spr_head_female1,spr_head_female2);
	global.player_control=controls.touch;
	global.player_weapon=global.weapons[0];
	global.player_armor=global.armors[0];
	global.player_helm=global.helms[0];
	global.player_hp_max=ds_list_find_value(global.lvl_hp,0);
	//global.player_hp=global.player_hp_max;
	global.player_str=ds_list_find_value(global.lvl_str,0);
	global.player_res=ds_list_find_value(global.lvl_res,0);
	global.player_spd=ds_list_find_value(global.lvl_spd,0);
	global.player_str_mod=1;
	global.player_res_mod=1;
	global.player_spd_mod=1;
	global.player_invincibility_timer=40;

//progression saveable in scr_savegame and scr_loadgame
	global.xp=0;
	global.deathcount=0;
	global.player_lives=0;
	global.story_progress=0;
	global.face_progress=0;
	global.face_progress_death=0;
	global.boss_progress=0;
	global.boss_boat=false;
	global.princess=true;
	global.introcinematic=false;
	global.followers=[];
	global.allheads=false;
	
	global.unlock_wpn=ds_list_create();
	//Staring Weapons
	ds_list_add(global.unlock_wpn,0,29,41);

	global.unlock_arm=ds_list_create();
	//Staring Armors
	ds_list_add(global.unlock_arm,0,2,4);
	
	global.unlock_hlm=ds_list_create();
	//Starting Helms
	ds_list_add(global.unlock_hlm,0,8,14);
	
	//Rate percentage of enemies dropping items
	global.drop_rate=10;
	
	// motion planning grid for character pathfinding
	global.pathfinding_grid = -1;
	
	scr_loadgame();
	csv_level_import("CSV 1Bit Elements - Level Chart.csv"); // restore ds_lists

#endregion
#region audio mixing
	if !audio_group_is_loaded(ag_character) {audio_group_load(ag_character);}
	if !audio_group_is_loaded(ag_backgrounds) {audio_group_load(ag_backgrounds);}
	if !audio_group_is_loaded(ag_music) {audio_group_load(ag_music);}
	if !audio_group_is_loaded(ag_assets) {audio_group_load(ag_assets);}
	if !audio_group_is_loaded(ag_weapons) {audio_group_load(ag_weapons);}
	if !audio_group_is_loaded(ag_ui) {audio_group_load(ag_ui);}
	
	global.audio=2;

	global.audio_footsteps=		global.audio*0.035;
	global.audio_weapons=		global.audio*.21//0.25;
	global.audio_hits=			global.audio*0.17;
	global.audio_voices=		global.audio*0.15;
	global.audio_death=			global.audio*0.15;
	global.audio_deathxp=		global.audio*0.32;
	global.audio_ui=			global.audio*0.4;
	global.audio_bonfire=		global.audio*0.25;
	global.audio_breakable=		global.audio*0.2;
	
	global.audio_backgrounds=	global.audio*1.3//1.1;

	global.audio_faces=			global.audio*1;
	global.audio_music=			global.audio*.8;
		
	audio_falloff_set_model(audio_falloff_linear_distance_clamped);
	
#endregion
}
