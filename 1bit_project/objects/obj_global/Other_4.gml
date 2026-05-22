//surface_resize(application_surface,room_width,room_height);
scr_loadgame();

if (global.widescreen)
{
	var _dw = display_get_width();
	var _dh = display_get_height();
	surface_resize(application_surface, round(global.res_y * _dw / _dh), global.res_y);
}
else
{
	surface_resize(application_surface, global.res_x, global.res_y);
}

audio_master_gain(1);

if room==rm_boat
|| room==rm_setup
|| room==rm_glitch
|| room==rm_cinematic_intro
{instance_create_depth(x,y,-y,obj_fx_fadein_fast);}

else
{instance_create_depth(x,y,-y,obj_fx_fadein);}

init_pathfinding_grid();

if !instance_exists(obj_audio_control) {instance_create(obj_audio_control);}

if room==rm_world
{
	show_debug_message("world loaded");
	//beginning of the game
	if global.story_progress==1
	{
		//layer_destroy("onlystory1");
		layer_destroy_instances("onlystory2and3");
		layer_destroy_instances("onlystory3");
		layer_destroy_instances("onlystory4");
		layer_destroy_instances("onlystory5");
	}
	
	//after you saw the boat
	if global.story_progress==2
	{
		layer_destroy_instances("onlystory1");
		//layer_destroy_instances("onlystory2and3");
		layer_destroy_instances("onlystory3");
		layer_destroy_instances("onlystory4");
		layer_destroy_instances("onlystory5");
	}
	
	//when you saw the boss
	if global.story_progress==3
	{
		layer_destroy_instances("onlystory1");
		//layer_destroy_instances("onlystory2and3");
		//layer_destroy_instances("onlystory3");
		layer_destroy_instances("onlystory4");
		layer_destroy_instances("onlystory5");
	}
	
	//beginning of the game
	if global.story_progress==4
	{
		layer_destroy_instances("onlystory1");
		layer_destroy_instances("onlystory2and3");
		layer_destroy_instances("onlystory3");
		//layer_destroy_instances("onlystory4");
		layer_destroy_instances("onlystory5");
		layer_destroy_instances("char_other");
		layer_destroy_instances("char_spawn");
	}
	
	//beginning of the game
	if global.story_progress==5
	{
		layer_destroy_instances("onlystory1");
		//layer_destroy_instances("onlystory2and3");
		//layer_destroy_instances("onlystory3");
		layer_destroy_instances("onlystory4");
		//layer_destroy_instances("onlystory5");
		
		//layer_destroy_instances("char_other");
		//layer_destroy_instances("char_spawn");
		global.allheads=true;
	}
	
	////beginning of the game
	//if global.story_progress!=1
	//&& global.story_progress!=5
	//{layer_destroy("onlystory1")}
	
	////after reaching boat
	//if global.story_progress!=2
	//&& global.story_progress!=3
	//&& global.story_progress!=5
	//{layer_destroy("onlystory2and3")}
	
	////after seeing boss (addition to 2)
	//if global.story_progress!=1
	//&& global.story_progress!=2
	//&& global.story_progress!=4
	//{layer_destroy("onlystory3")}
	
	////after killing boss, ending things only
	//if global.story_progress!=4
	//{layer_destroy("onlystory4")}
}

game_set_speed(global.room_speed_default,gamespeed_fps);
gamepad_set_vibration(0,0,0);
// reset mouse tracking to prevent false cursor-show on room transition
global._prev_mouse_x = mouse_x;
global._prev_mouse_y = mouse_y;