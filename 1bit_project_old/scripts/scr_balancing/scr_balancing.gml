function scr_balancing(){
	
	defence_speed=1-((armor.weight+helm.weight+weapon.weight)/100);
	run_distance=run_distance_min/(spd*defence_speed);
	
	charisma=armor.charisma+helm.charisma;
	
	weapon_image_speed=animset_weapon_image_speed*weapon.atk_spd;
	//attack_range=round(animset_attack_range*weapon.atk_spd);
	//attack_range_strong=round(animset_attack_range_strong*weapon.atk_spd);
	atk1_time=round(animset_atk1_time/(weapon.atk_spd));
	if atk1_time<4 {atk1_time=4;}
	//atk1_sp=round(animset_atk1_sp*weapon.atk_spd);
	//atk1_sp_decrease=animset_atk1_sp_decrease/weapon.atk_spd;
	atk2_time=round(animset_atk2_time/(weapon.atk_spd));
	if atk2_time<atk1_time+4 {atk2_time=atk1_time+4;}
	//atk2_sp=round(animset_atk2_sp*weapon.atk_spd);
	//atk2_sp_decrease=animset_atk2_sp_decrease/weapon.atk_spd;

#region commented code
	//switch_animset(weapon.weapon_animset);
	//if helm.sprite = undefined
	//{helm.sprite =  character_head;}
	//if armor.sprite = undefined
	//{armor.sprite = character_body;}
	//sprite_body = armor.sprite;
	//sprites setup
	
	//sprite_set_offset(sprite_body,13,14);
	//sprite_set_speed(sprite_body,0,spritespeed_framespersecond);
	//sprite_set_offset(helm.sprite,14,11);
	//sprite_set_speed(helm.sprite,0,spritespeed_framespersecond);
#endregion
}