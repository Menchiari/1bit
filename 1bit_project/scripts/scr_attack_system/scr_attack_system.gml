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
			var total_damage=(((damage+random_range(0,damage_variation))*str)/(enemy.res*(enemy.armor.defence+enemy.helm.defence)));
			if scr_faction_check(enemy)
			&& instance_exists(obj_hero)
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
			/////////////
			//ATTACKING//
			/////////////
				if enemy.state!=states.hit && enemy.invincible=false && instance_exists(obj_hero)
				{
					var damaged=false;
					var screenshake=instance_create(obj_fx_screenshake);
					screenshake.shake=total_damage*4;
			//Blocking
					if enemy.blocking==true
					//|| enemy.state==states.block_hit
					||(enemy.state==states.block
					&& enemy.timer<=enemy.counter_time
					&& ((enemy.res*(enemy.armor.defence+enemy.helm.defence)*(enemy.hp)/2>damage) && enemy!=obj_hero.id)
					////todo add no blocking on hands or no weapon////
					//&& enemy.hp>hp/2
					) //added block counter
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
												
						show_debug_message(string(object_get_name(enemy.object_index))+" has blocked an attack from "+string(object_get_name(object_index)));
					}					
	//if not blocking					
					else
					{
						enemy.state=states.hit;
						enemy.direction=direction;
						enemy.speed=speed*push;
						
/*////ATTACK-->////*/	enemy.hp-=total_damage;

						damaged=true;
						
						///////////////////////////////AI REACTION///////////////////////////////////////
						enemy.ai_target=self.id;
						enemy.ai_state=ai_states.fight;
						if enemy!=obj_hero.id {enemy.control=controls.ai;}
						/////////////////////////////////////////////////////////////////////////////////
						
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
				string(self.name)+" has strength: "+string(str)+" and weapon power "+string(damage)+" with damage variation "+string(damage_variation)
			)
			show_debug_message
			(
				string(enemy.name)+" has resistance: "+string(enemy.res*(enemy.armor.defence+enemy.helm.defence))
			)
			show_debug_message
			(
				string(self.name)+" has charisma: "+string(charisma) + " and " + string(enemy.name)+" enemy has charisma: "+string(enemy.charisma)
			)
			show_debug_message
			(
				string(self.name)+" causes damage: "+string(total_damage)+" to "+string(enemy.name)
			)
			show_debug_message
			(
				string(enemy.name+" has: "+string(enemy.hp)+" health left out of "+string(enemy.hp_max)+" total")
				+" || "+string(self.name+" has: "+string(hp)+" health left out of "+string(hp_max)+" total")
			)
			show_debug_message("");
			
			#region FLEEING CASES
			if instance_exists(enemy)
			{
			    var hp_factor		= (1-(enemy.hp/enemy.hp_max))	*15;		// more hurt = more scared
			    var str_factor		= ((self.str/enemy.res)-1)		*5;			// stronger attacker = fear
			    var charisma_fear	= ((self.charisma+abs(enemy.charisma))*-8); // low charisma causes more threat if charisma is near zero

			    var flee_chance = (hp_factor+str_factor+charisma_fear)/(abs(enemy.charisma)+1);
			    if random_range(0, 100)<flee_chance {enemy.ai_state=ai_states.flee;}
				
				show_debug_message("hp factor: "+string(hp_factor)+", str factor: "+string(str_factor)+", charisma fear: "+string(charisma_fear))
			    show_debug_message("flee chance of " + string(enemy.name) + ": " + string(flee_chance));

			}
			#endregion
//AUDIO//
			scr_audio_weapon_hit(image_index,clamp(.5+(total_damage/10),.6,1.5))
			show_debug_message("audio hit at damage "+string(clamp(.5+(total_damage/10),.5,1.5)));
		}
////////BREAKABLE IF NOT ENEMY////////
		else
		{
			//hit wall
			if collision_circle(x,y,radius*.75,obj_collider,true,true)
			{
				scr_audio_weapon_hit(image_index,.25)
			}

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