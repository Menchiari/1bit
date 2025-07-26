// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_controls_main(){
}

function scr_refresh_cursor(){
	global.cursor_x=mouse_x;
	global.cursor_y=mouse_y;
	global.gamepad_used=false;
	
	if (gamepad_is_connected(0)) && instance_exists(obj_hero) {
		
		var gamepad_distance = 50;
		var gamepad_distance_modifier = 0;
				
	    if (abs(gamepad_axis_value(0, gp_axislh)) > 0.1)
		|| (abs(gamepad_axis_value(0, gp_axislv)) > 0.1)
		|| (abs(gamepad_button_check(0,gp_face1)) > 0.1)
		{
	        // Axis is being moved
			global.gamepad_used=true;
			gamepad_distance_modifier=gamepad_button_check(0,gp_shoulderrb)*gamepad_distance;
			global.cursor_x=obj_hero.x+((gamepad_distance+gamepad_distance_modifier)*gamepad_axis_value(0, gp_axislh));
			global.cursor_y=obj_hero.y+((gamepad_distance+gamepad_distance_modifier)*gamepad_axis_value(0, gp_axislv)*.5);
	    }
	}
}

function scr_button_pressed(_mouse_button=mb_any){
	if mouse_check_button_pressed(_mouse_button) {return true;}
	if global.gamepad_used==true
	{
		if gamepad_button_check_pressed(0,gp_face1) {return true;}
	}
}

function scr_button_released(_mouse_button=mb_any){
	if mouse_check_button_released(_mouse_button) {return true;}
	if global.gamepad_used==true
	{
		if gamepad_button_check_released(0,gp_face1) {return true;}
	}
}

function scr_button(_mouse_button=mb_any){
	if mouse_check_button(_mouse_button) {return true;}
	if global.gamepad_used==true
	{
		if gamepad_button_check(0,gp_face1) {return true;}
	}
}