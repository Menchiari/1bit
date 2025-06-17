scr_character_scripts();
function scr_state_machine(){

/////////////////////
////STATE MACHINE////
/////////////////////

	image_speed=animation_speed_default;
	if speed>max_sp {speed=max_sp;}
	
////////////////////
//////controls//////
////////////////////
	if control=controls.touch
	{
		if mouse_check_button_pressed(mb_any) {timer=0; mouse_pressed=true;}
		if mouse_check_button_released(mb_any){mouse_pressed=false;}
	}
	
//artificial intelligence controls
	if control=controls.ai {scr_ai_main();}

//state machine
	sprite_index=sprite_skin;
	if hp>hp_max {hp=hp_max;}
	if hp<hp_min && hp>0 {hp+=hp_recharge/room_speed;}
	if hp<=0 {state=states.death;}

	switch state
	{
		case states.spawn: scr_sm_spawn() break;
		case states.idle: scr_sm_idle() break;
		case states.walk: scr_sm_walk() break;
		case states.run: scr_sm_run() break;
		case states.roll: scr_sm_roll() break;
		case states.block: scr_sm_block() break;
		case states.attack: scr_sm_attack() break;
		case states.attack_strong: scr_sm_attack_strong() break;
		case states.block_hit: scr_sm_block_hit() break;
		case states.hit: scr_sm_hit() break;
		case states.collide_hit: scr_sm_collide_hit() break;
		case states.death: scr_sm_death() break;
		default: break;
	}
	
//text
	if instance_exists(obj_hero)
	//&& (state==states.spawn || state==states.idle || state==states.block)
	{
		if point_distance(x,y,obj_hero.x,obj_hero.y)<speech_distance {speech_visible=true;}
		if point_distance(x,y,obj_hero.x,obj_hero.y)>speech_distance*1.5 {speech_visible=false;}
	}
}