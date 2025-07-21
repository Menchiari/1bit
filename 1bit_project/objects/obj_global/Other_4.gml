//surface_resize(application_surface,room_width,room_height);
surface_resize(application_surface,global.res_x,global.res_y);

if room==rm_boat
|| room==rm_setup
|| room==rm_glitch
{instance_create_depth(x,y,-y,obj_fx_fadein_fast);}

else
{instance_create_depth(x,y,-y,obj_fx_fadein);}

init_pathfinding_grid();

if room==rm_world
{
	show_debug_message("world loaded");
	//beginning of the game
	if global.story_progress==1
	{
		//layer_destroy("onlystory1");
		layer_destroy("onlystory2and3");
		layer_destroy("onlystory3");
		layer_destroy("onlystory4");
		layer_destroy("onlystory5");
	}
	
	//after you saw the boat
	if global.story_progress==2
	{
		layer_destroy("onlystory1");
		//layer_destroy("onlystory2and3");
		layer_destroy("onlystory3");
		layer_destroy("onlystory4");
		layer_destroy("onlystory5");
	}
	
	//when you saw the boss
	if global.story_progress==3
	{
		layer_destroy("onlystory1");
		//layer_destroy("onlystory2and3");
		//layer_destroy("onlystory3");
		layer_destroy("onlystory4");
		layer_destroy("onlystory5");
	}
	
	//beginning of the game
	if global.story_progress==4
	{
		layer_destroy("onlystory1");
		layer_destroy("onlystory2and3");
		layer_destroy("onlystory3");
		//layer_destroy("onlystory4");
		layer_destroy("onlystory5");
		layer_destroy("char_other");
		layer_destroy("char_spawn");
	}
	
	//beginning of the game
	if global.story_progress==5
	{
		//layer_destroy("onlystory1");
		//layer_destroy("onlystory2and3");
		//layer_destroy("onlystory3");
		//layer_destroy("onlystory4");
		//layer_destroy("onlystory5");
		//layer_destroy("char_other");
		//layer_destroy("char_spawn");
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