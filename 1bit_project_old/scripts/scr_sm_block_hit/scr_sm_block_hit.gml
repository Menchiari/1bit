// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_sm_block_hit(){
	scr_animation(block_hit_a,block_hit_b);
	image_speed=.2;
	scr_footsteps(block_hit_a,block_hit_b,1.5);
	
	if speed>1 {speed-=block_sp_decrease;}
	if speed<-1 {speed+=block_sp_decrease;}
	else{speed=0;path_end();}
	
	if image_index==block_hit_b-1
	{
		state=states.idle;
	}

	timer+=1;
	scr_block_controls();

}