function scr_sm_attack_strong(){
	scr_animation(attack_a,attack_b);
	scr_footsteps(attack_a,attack_fr,1.5);
	image_speed=animation_speed_default*spd*defence_speed*weapon_image_speed;
	blocking=false;
	
	//shooting
	if round(image_index)==attack_fr
	&& weapon.bullets>0
	{
		image_speed=1;
		var bullet=instance_create(obj_bullet);
			bullet.dir=point_direction(x,y,dest_x,dest_y);
			bullet.destx=dest_x;
			bullet.desty=dest_y;
			bullet.damage=weapon.atk_dmg_strong;
			bullet.damage_variation=weapon.atk_dmg_variation;
			bullet.faction=faction;
			bullet.spread=attack_range_strong;
			bullet.bullets=weapon.bullets;
			var screenshake=instance_create(obj_fx_screenshake);
			screenshake.shake=weapon.atk_dmg_strong;
	}
	
	//movement
	if image_index==attack_a
	{
		var move_speed=atk2_sp*(spd*defence_speed);
		if weapon.bullets>0 {move_towards_point(x+x-dest_x,y+y-dest_y,move_speed/1.5);}
		else {move_towards_point(dest_x,dest_y,move_speed);}
	}
	if speed>0 {speed-=atk2_sp_decrease*((spd*defence_speed)/2);}
	else if speed<0 {speed+=atk2_sp_decrease*((spd*defence_speed)/2);}
	
	if image_index>=attack_b-1 {state=states.idle;}
	scr_attack_system(attack_fr,attack_range_strong,weapon.atk_dmg_strong,weapon.atk_dmg_variation,2,atk_push_speed_divider);
	
	//controls
	if control=controls.touch
	{
		scr_flip_check_mouse(x-(click_x-dest_x),y-(click_y-dest_y),1);
	}
	
	//var frame_speed=(((attack_1_fr-attack_1_a)*(weapon_image_speed*animation_speed_default)/room_speed))
	//show_debug_message(string(round((((attack_1_fr-attack_1_a)*(weapon_image_speed*animation_speed_default)/room_speed))+(atk1_time/room_speed)*10)/10)+"~"+string(round((((attack_1_fr-attack_1_a)*(weapon_image_speed*animation_speed_default)/room_speed))+(atk2_time/room_speed)*10)/10))
}