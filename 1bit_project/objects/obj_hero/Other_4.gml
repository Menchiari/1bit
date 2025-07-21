/// @description
// Inherit the parent event
event_inherited();
show_debug_message("Room started, hero created at coordinates x: "+string(x)+", y: "+string(y));
//alarm[11]=1;

// If global.followers has mercenaries saved, spawn them
//create mercenaries if there are any
if (array_length(global.followers) > 0)
{
	for (var i = 0; i < array_length(global.followers); i++)
	{
		var f = global.followers[i];

		var inst=instance_create_depth(x,y-(array_length(global.followers)*10),depth,f.obj);
		
        // Restore saved variables
        inst.character_head = f.character_head;
        inst.name = f.name;
        inst.weapon = f.weapon;
        inst.armor = f.armor;
        inst.helm = f.helm;
        inst.hp = f.hp;
        inst.str = f.str;
        inst.res = f.res;
        inst.skin_color = f.skin_color;
        inst.speech_color = f.speech_color;
		inst.start_following=true;
		
		show_debug_message(string(inst.name)+" created and following = "+string(inst.start_following));
		show_debug_message("hero is at coordinates x: "+string(x)+", y: "+string(y)+" after spawning "+string(inst.name));
    }
	
    // Clear array if you don’t want them duplicated in next room
    if (!is_array(global.followers)) {global.followers=[];}

}

show_debug_message("hero moved at coordinates x: "+string(x)+", y: "+string(y));