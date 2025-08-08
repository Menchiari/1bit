/// @description spawn
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if instance_exists(obj_hero)
{
	if point_distance(x,y,obj_hero.x,obj_hero.y)<trigger_distance && trigger==false
	{
		if trigger_spawn==false {
			var _dirt = choose(
			    snd_dirt_06,
			    snd_dirt_07,
			    snd_dirt_08,
			    snd_dirt_09,
				snd_vox_skeleton,
				snd_vox_skeleton,
				snd_vox_skeleton
			);
			scr_audio_play(_dirt,global.audio_voices*.6,random_range(1,1.5));
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