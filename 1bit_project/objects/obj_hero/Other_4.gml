/// @description
// Inherit the parent event
event_inherited();
show_debug_message("Room started, hero created at coordinates x: "+string(x)+", y: "+string(y));
//alarm[11]=1;

// If global.followers has mercenaries saved, spawn them
//create mercenaries if there are any
if (array_length(global.followers) >= 0)
{
	for (var i = 0; i < array_length(global.followers); i++)
	{
		var f = global.followers[i];

		var inst=instance_create_depth(x+random_range(-5,5),y+random_range(-20,10),depth,f.obj);
		
        // Restore saved variables
        inst.character_head=f.character_head_var;
        inst.name=f.name_var;
		
        inst.weapon_var=f.weapon_var;
        inst.armor_var=f.armor_var;
        inst.helm_var=f.helm_var;
		
		with inst
		{
			equip_weapon(global.weapons[weapon_var]);
			equip_armor(global.armors[armor_var]);
			equip_helm(global.helms[helm_var]);
		}
		
        inst.hp=f.hp_var;
        inst.str=f.str_var;
        inst.res=f.res_var;
        inst.skin_color=f.color_var;
        inst.speech_color=f.speech_color_var;
		inst.start_following=true;
		
		show_debug_message(string(inst.name)+" created and following = "+string(inst.start_following));
    }
    // Reset the list to prevent duplication
    global.followers = [];
}

if speech_text=""
&& room!=rm_menu_character
&& room!=rm_menu_deletesave
&& room!=rm_story_AI_2
&& room!=rm_story_AI
&& room!=rm_boat
{
	scr_hero_dialogue();
}