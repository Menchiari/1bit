function scr_attack_system(attack_frame,radius,damage,damage_variation,push,push_divider){
	//split push in half
	push=push/push_divider;
	if round(image_index)==attack_frame
	{
		image_speed=1;
///ENEMY STUFF///
		var enemy=collision_circle(x,y,radius,obj_character,true,true);
		if radius==-1 {enemy=collision_line(x,y,xprevious,yprevious,obj_character,true,true)}
		if enemy
		{
			var total_damage=(((damage+random_range(0,damage_variation))*str)/(enemy.res*enemy.armor.defence*enemy.helm.defence));
			if scr_faction_check(enemy)
			&& instance_exists(obj_hero) //todo make it so that when hero dies others can die as well?
			{
				if enemy.object_index==obj_hero.object_index
				|| object_index==obj_hero.object_index
				{
					var time_freeze=instance_create_depth(x,y,-y,obj_time_freeze);
					time_freeze.room_speed_modifier=.3//how slow does it get per each enemy
					time_freeze.room_speed_reset_time=3;//frames before reset
				}
				if enemy.faction==factions.neutral && object_index==obj_hero.object_index && !collision_circle(x,y,500,obj_enemy,false,true)
				{
					enemy.faction=factions.enemy;
					repeat(10)
					{
						var witness=collision_circle(x,y,100,obj_character,true,true)
						if instance_exists(witness)
						{
							witness.faction=factions.enemy;
							witness.control=controls.ai;
							witness.ai_state_original=ai_states.search;
						}
					}
				}
			//Attack stuff
				if enemy.state!=states.hit && enemy.invincible=false && instance_exists(obj_hero)
				{
					var damaged=false;
					
					if enemy.object_index==obj_hero.object_index
					|| object_index==obj_hero.object_index
					{
						var screenshake=instance_create(obj_fx_screenshake);
						screenshake.shake=total_damage;//(str/enemy.res)*damage;
					}
	//if blocking
					if enemy.state==states.block_hit
					|| enemy.blocking==true
					||(enemy.state==states.block
					&& enemy.timer<=enemy.counter_time
					&& ((enemy.res*(enemy.armor.defence*enemy.helm.defence)*(enemy.hp)/2>damage) && enemy!=obj_hero.id)
					//&& enemy.hp>hp/2
					) //added block instead of counter
					{
						enemy.image_index=enemy.block_hit_a;
						enemy.state=states.block_hit;
						enemy.speed=speed;
						enemy.direction=direction;
						direction=-direction;
						
						var damage_value=instance_create_depth(enemy.x,enemy.y,enemy.depth,obj_ui_number);
						damage_value.text="BLOCKED";
						if instance_exists(obj_hero) {if enemy!=obj_hero.id {damage_value._color=c_red;}}
						if instance_exists(obj_ally) {if enemy!=obj_ally.id {damage_value._color=c_red;}}
												
						//show_debug_message(string(object_get_name(enemy))+" has blocked an attack from "+string(object_get_name(object_index)));						
					}
					
	//if not blocking					
					else
					{
						enemy.state=states.hit;
						enemy.direction=direction;
						enemy.speed=speed*push;
						
/*////ATTACK-->////*/	enemy.hp-=total_damage;

						damaged=true;
						
						if room!=rm_death
						{
							var damage_value=instance_create_depth(enemy.x,enemy.y,enemy.depth,obj_ui_number);
							damage_value.number=total_damage;
							if instance_exists(obj_hero) {if enemy==obj_hero.id {damage_value._color=c_red;}}
						}

				//flash
						if instance_exists(obj_hero)
						{
							if enemy==obj_hero.id
							{
								var screenshake=instance_create(obj_fx_screenshake);
								screenshake.shake=total_damage;//(str/enemy.res)*damage;
								var _flash=instance_create(obj_fx_flash);
								_flash.gamma_multiplier-=screenshake.shake;
							}
						}
					}					
					
			//helmet flies off sometimes
					var helm_chance=irandom_range(0,100);
					if helm_chance<5/(enemy.helm.defence*2)
					{
						//enemy.helm=global.helms[0];
						with enemy{equip_helm(global.helms[0]);}
						instance_create(obj_fx_bodypart);						
					}
				}
				enemy.invincible=true;
				enemy.alarm[2]=enemy.invincibility_timer;
			}
			
		//deactivate single character instances to check for collision separately
			melee_atk_buffer[melee_atk_buffer_index] = enemy;
			melee_atk_buffer_index += 1
			instance_deactivate_object(enemy);
			scr_attack_system(attack_frame,radius,damage/2,damage_variation/2,push,push_divider);
			
		//debug
			show_debug_message
			(
				string(object_get_name(object_index))+" has strength: "+string(str)+" and weapon power "+string(damage)+" with damage variation "+string(damage_variation)
			)
			show_debug_message
			(
				string(object_get_name(enemy.object_index))+" has resistance: "+string(enemy.res*enemy.armor.defence*enemy.helm.defence)
			)
			show_debug_message
			(
				string(object_get_name(object_index))+" causes damage: "+string(total_damage)+" to "+string(object_get_name(enemy.object_index))
			)
			show_debug_message
			(
				string(object_get_name(enemy.object_index)+" has: "+string(enemy.hp)+" health left out of "+string(enemy.hp_max)+" total")
				+" || "+string(object_get_name(object_index)+" has: "+string(hp)+" health left out of "+string(hp_max)+" total")
			)
			show_debug_message("");
		}
////////BREAKABLE IF NOT ENEMY////////
		else
		{
		//reactivate all character instances after the check
	        for (var i=0; i<array_length_1d(melee_atk_buffer); i++)
	        {
	            instance_activate_object(melee_atk_buffer[i]);
	        }
		//reset the array
	        melee_atk_buffer=0;
	        melee_atk_buffer_index=0;
			
			var breakable=collision_circle(x,y,radius,obj_breakable,true,true);
			if radius==-1 {breakable=collision_line(x,y,xprevious,yprevious,obj_breakable,true,true)}
			if breakable
			{
			//Attack stuff
				breakable.state=states.hit;
				if breakable.invincible==false
				{
					breakable.hp-=((damage*str)/breakable.res)+random_range(0,damage_variation);
					breakable.shake_power=(str/breakable.res)*damage;
				}
					
			//deactivate single breakable instances to check for collision separately
				melee_atk_buffer_br[melee_atk_buffer_index_br] = breakable;
				melee_atk_buffer_index_br += 1
				instance_deactivate_object(breakable);
				scr_attack_system(attack_frame,radius,damage,damage_variation,push,push_divider);
			}
			else
			{
			//reactivate all breakable instances after the check
			    for (var i=0; i<array_length_1d(melee_atk_buffer_br); i++)
			    {
			        instance_activate_object(melee_atk_buffer_br[i]);
			    }
			//reset the breakable instances array
			    melee_atk_buffer_br=0;
			    melee_atk_buffer_index_br=0;
			}
		}
	}
}