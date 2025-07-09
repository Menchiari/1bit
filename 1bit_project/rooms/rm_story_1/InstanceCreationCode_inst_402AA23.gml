with obj_hero
{	
	trigger_spawn=false;
	state=states.spawn;
	speech_text=choose("dad?","mom?");
	global.player_head=spr_head;
	character_head=spr_head;
}