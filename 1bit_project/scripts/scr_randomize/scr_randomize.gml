// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_randomize(){
	random_set_seed(current_second+current_hour+current_day+current_year);
}