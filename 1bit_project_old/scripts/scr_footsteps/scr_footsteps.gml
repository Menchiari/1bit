function scr_footsteps(left_foot,right_foot,step_power)
{
//declare variables
	footprint=true;
	footstep_sound=choose(snd_footstep_walk_asf_1,snd_footstep_walk_asf_2,snd_footstep_walk_asf_3,snd_footstep_walk_asf_4,snd_footstep_walk_asf_5,snd_footstep_walk_asf_6,snd_footstep_walk_asf_7,snd_footstep_walk_asf_8,snd_footstep_walk_asf_9,snd_footstep_walk_asf_10,snd_footstep_walk_asf_11,snd_footstep_walk_asf_12,snd_footstep_walk_asf_13,snd_footstep_walk_asf_14,snd_footstep_walk_asf_15,snd_footstep_walk_asf_16,snd_footstep_walk_asf_17,snd_footstep_walk_asf_18,snd_footstep_walk_asf_19,snd_footstep_walk_asf_20);
	if step_power>=1 footstep_sound=choose(snd_footstep_run_asf_1,snd_footstep_walk_asf_2,snd_footstep_walk_asf_3,snd_footstep_walk_asf_4,snd_footstep_walk_asf_5,snd_footstep_walk_asf_6,snd_footstep_walk_asf_7,snd_footstep_walk_asf_8,snd_footstep_walk_asf_9,snd_footstep_walk_asf_10,snd_footstep_walk_asf_11,snd_footstep_walk_asf_12,snd_footstep_walk_asf_13,snd_footstep_walk_asf_14,snd_footstep_walk_asf_15,snd_footstep_walk_asf_16,snd_footstep_walk_asf_17,snd_footstep_walk_asf_18,snd_footstep_walk_asf_19,snd_footstep_walk_asf_20);
	if step_power>=1.5 footstep_sound=choose(snd_fall_asf_1,snd_fall_asf_2,snd_fall_asf_3,snd_fall_asf_4,snd_fall_asf_5,snd_fall_asf_6,snd_fall_asf_7);
	splash_size=step_power;
	footprint_opacity=.5;
	footprint_color=c_black;
	footprint_fade=0;
	footprint_min=0;
	
//collision with types of terrain
	if collision_point(x,y,obj_fx_blood,true,true) {terrain=terrains.blood;}
	//else if collision_point(x,y,object,true,true) {/*choose terrain*/}
	else {terrain=terrains.stone;}

//properties for each terrain type
	switch(terrain)
	{
		//add variables for terrain type
		//todo add type of sound
		case terrains.wood:
		splash_size=.1;
		break;
		case terrains.wood_wet:
		splash_size=1;
		break;
		case terrains.stone:
		splash_size*=.05;
		footprint_min=.05;
		if footprint_opacity<.2 {footprint_color=c_black;}
		break;
		case terrains.stone_wet:
		splash_size=1.5;
		footprint_opacity=.25;
		footprint_fade=.005;
		footprint_min=0;
		break;
		case terrains.mud:
		splash_size=1.5;
		footprint_opacity=.25;
		footprint_fade=.005;
		break;
		case terrains.blood:
		splash_size=1.5;
		footprint_opacity=random_range(.5,.75);
		footprint_color=global.blood_color;
		footprint_fade=.02;
		break;
		default:
		terrain=terrains.stone;
		break;
	}
	splash_size=splash_size*step_power
	
//add splash
	if image_index==left_foot
	{
		var lfoot_splash=instance_create_depth(x-(2*dir),y,-y,obj_fx_splash)
		lfoot_splash.footprint=footprint;
		lfoot_splash.splash_size=splash_size;
		lfoot_splash.footprint_opacity=footprint_opacity;
		lfoot_splash.footprint_color=footprint_color;
		lfoot_splash.footprint_fade=footprint_fade;
		lfoot_splash.footprint_min=footprint_min;
	}
	if image_index==right_foot
	{
		var rfoot_splash=instance_create_depth(x+(2*dir),y,-y,obj_fx_splash)
		rfoot_splash.footprint=footprint;
		rfoot_splash.splash_size=splash_size;
		rfoot_splash.footprint_opacity=footprint_opacity;
		rfoot_splash.footprint_color=footprint_color;
		rfoot_splash.footprint_fade=footprint_fade;
		rfoot_splash.footprint_min=footprint_min;
	}
	
//play audio
	if image_index==left_foot || image_index==right_foot
	{
		audio_sound_pitch(footstep_sound,random_range(2,2.5));
		audio_sound_gain(footstep_sound,step_power/20,0);
		audio_play_sound_at(footstep_sound,x,y,y,100, 300, 1, false, 1);
	}
}