// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_sm_collide_hit(){
	scr_animation(idle_hit_a,idle_hit_b);
	image_speed=.75;
	scr_footsteps(idle_hit_a,idle_hit_b,1.5);
	if image_index==idle_hit_b-1
	{
		state=states.idle;
	}
}