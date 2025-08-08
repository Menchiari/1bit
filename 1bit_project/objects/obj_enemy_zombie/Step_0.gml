/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if image_index==wakeup_ground_a {skin_color=c_white;}
else {skin_color=c_red;}

if instance_exists(obj_hero)
{
	if point_distance(x,y,obj_hero.x,obj_hero.y)<trigger_distance && trigger==false
	{
		if trigger_spawn=false {
			var _dirt = choose(
			    snd_dirt_01,
			    snd_dirt_02,
			    snd_dirt_03,
			    snd_dirt_04,
			    snd_dirt_05,
			    snd_dirt_06,
			    snd_dirt_07,
			    snd_dirt_08,
			    snd_dirt_09,
			    snd_dirt_10,
			);
			scr_audio_play(_dirt,global.audio_voices*.9,random_range(1,2));
		}
		trigger_spawn=true;
		if state==states.idle
		|| state==states.hit
		{
			control=controls.ai;
			ai_state=ai_states.idle;
			ai_state_original=ai_states.chase;
			trigger=true;
		}
	}
}