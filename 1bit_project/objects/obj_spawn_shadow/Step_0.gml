/// @description
if once==true && instance_exists(obj_hero)
{
	once=false;
	var _spawnchar = instance_create_depth(x,y,-y,obj_enemy);
	_spawnchar.ai_state=ai_states.guard;
	
	//customize character
	_spawnchar.character_head=obj_hero.character_head
	_spawnchar.state=states.idle;
	//customize equipment
	with(_spawnchar)
	{
		equip_weapon(global.player_weapon)
		equip_armor(global.player_armor);
		equip_helm(global.player_helm);
	}

	//customize ai
	_spawnchar.control=controls.ai;
	_spawnchar.faction=factions.enemy;
	_spawnchar.ai_type=ai_types.ai_aggressive;
	_spawnchar.ai_state=ai_states.guard;
	_spawnchar.ai_state_original=_spawnchar.ai_state;

	//main stats
	_spawnchar.hp_max=obj_hero.hp_max*3;
	_spawnchar.hp=_spawnchar.hp_max;
	_spawnchar.str=obj_hero.str;
	_spawnchar.res=obj_hero.res;

	_spawnchar.speech_text="me again";
	_spawnchar.speech_distance=50;
}