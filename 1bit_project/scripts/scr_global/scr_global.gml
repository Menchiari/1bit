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

#region GLOBAL VARIABLES
function init_globals(){
//setup
	global.control_type=controls.gamepad;

	global.depth_ui_front=-8000;
	global.depth_ui=-5000;
	global.depth_floor=0;
	global.room_speed_default=25;
	global.gamma_default=1;
	room_speed=global.room_speed_default;
	global.shader=shd_1bit_blood;
	global.res_x=180//280;//220;
	global.res_y=320//400;//380;

	global.blood_color=c_orange;//c_fuchsia;//c_red;

	global.orientation=0;// 0=portrait, 90=landscape;

	global.slot=0;
	global.chosen_room=rm_start;

	if !audio_group_is_loaded(ag_character) {audio_group_load(ag_character);}
	
}
//random seed
	ini_open("random.seed")
	default_seed=current_second+current_hour+current_day+current_year;
	global.current_seed=ini_read_real("RANDOM","SEED",default_seed);
	ini_write_real("RANDOM","SEED",global.current_seed);
	ini_close();
	random_set_seed(global.current_seed);
	
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
	global.player_head=spr_head_female;
	global.player_control=controls.touch;
	global.player_weapon=global.weapons[0];
	global.player_armor=global.armors[0];
	global.player_helm=global.helms[0];
	global.player_hp_max=ds_list_find_value(global.lvl_hp,0);
	//global.player_hp=global.player_hp_max;
	global.player_str=ds_list_find_value(global.lvl_str,0);
	global.player_res=ds_list_find_value(global.lvl_res,0);
	global.player_spd=ds_list_find_value(global.lvl_spd,0);
	global.player_invincibility_timer=40;

//progression todo make it saveable
	global.xp=0;
	global.deathcount=0;
	global.player_lives=0;
	
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
	
	scr_loadgame();

#endregion
