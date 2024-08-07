/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
#region Generate Labyrinth
if global.labyrinth_generated = false
{
	random_set_seed(global.current_seed);
	do{
		var next_hex = find_next_hex();

		if next_hex != undefined 
		{
			find_hex_instance(next_hex).visited = true;
			ds_stack_push(map_stack,current_hex);
			ds_stack_push(dir_stack,last_dir);
			set_hex_wall(current_hex,last_dir,0);
			set_hex_wall(next_hex,inverse_direction(last_dir),0);
			current_hex = next_hex;
			find_hex_instance(current_hex).HexColor = c_blue;
		}
		else if !ds_stack_empty(map_stack)
		{	
			current_hex = ds_stack_pop(map_stack);
			find_hex_instance(current_hex).HexColor = c_green;
		}
		else
		{global.labyrinth_generated = true}
		}
	until (global.labyrinth_generated = true)
}
#endregion


#region Assign themes
if global.theme_assigned = false && global.labyrinth_generated = true
{
	random_set_seed(global.current_seed);
	do{
		var points_per_region;
		
		points_per_region[0] = 100//100; //camp plains woods
		points_per_region[1] = 600//300; //castle ruins fortsess dungeon
		points_per_region[2] = 500//250; //forest village witch
		points_per_region[3] = 700//350; //tundra camps mountains
		points_per_region[4] = 600//300; // swamp fort desert
		points_per_region[5] = 800//400; // citz camps rural downtown
		points_per_region[6] = 1000//500; // cyber wall society hangar
		
		
		
		create_region(new map_axial(0,0),global.region_array[0],points_per_region[0]);
		
		region_location = ds_list_create()
		for (var i = 0; i<6; i++)
		{
			ds_list_add(region_location, map_axial_scale(axial_directions[i],6));
		}
		ds_list_shuffle(region_location);
		for (var i = 0; i<6; i++)
		{//																	uncomment this to use all regions
			create_region(ds_list_find_value(region_location,i) ,global.region_array[i+1],points_per_region[i+1]);
		}
		
		//assign special hexes like direction and villages
		var direction_spot = new map_axial(2,2);
		var theme = ds_list_find_value(global.theme_count_list,19);
		for (var i = 0; i<6; i++)
		{
			find_hex_instance( direction_spot ).theme = new theme_strct(theme.name, theme.start, theme.finish);   //"01_direction";
			direction_spot = rotate_coord(direction_spot);
		}
		
		var village_spot = new map_axial(4,4);
		var theme = ds_list_find_value(global.theme_count_list,20);
		for (var i = 0; i<6; i++)
		{
			find_hex_instance( village_spot ).theme = new theme_strct(theme.name, theme.start, theme.finish);
			village_spot = rotate_coord(village_spot);
		}
		
		
		
		//tmp hero spawn
		
		var starting_hex = new map_axial(0,0);
	
		instance_create_depth(find_hex_instance(starting_hex).x,find_hex_instance(starting_hex).y,-find_hex_instance(starting_hex)-y,obj_camera_pos);
		instance_create_depth(find_hex_instance(starting_hex).x-30,find_hex_instance(starting_hex).y+20,-find_hex_instance(starting_hex)-y,obj_player_spawn);
		instance_create_depth(find_hex_instance(starting_hex).x,find_hex_instance(starting_hex).y,-find_hex_instance(starting_hex)-y,obj_region_center_camp);
		if instance_exists(obj_camera) {obj_camera.x=find_hex_instance(starting_hex).x; obj_camera.y=find_hex_instance(starting_hex).y;}
		

//		repeat(8) {instance_create_depth(find_hex_instance(starting_hex).x+random_range(-20,20),find_hex_instance(starting_hex).y+random_range(-20,20),-find_hex_instance(starting_hex)-y,obj_ally_ai);}
		
		
		//tmp test
		//var xx = obj_player_spawn.x;
		//var yy = obj_player_spawn.y;
		
		
		//spawn_npc_test(xx+20,yy, 2, global.NPCs);
		
		//spawn_npc_test(xx,yy, 27, global.NPC_count);
				
		
		
		
		
		
		instance_create_depth(x,y,-10000,obj_ui_compass);
		
		
		//cleanup
		ds_list_destroy(region_location);
		
		global.theme_assigned = true;
	}
	until global.theme_assigned = true;

}
#endregion
/*
else
{
	if global.spawn_phase_done = false {
		
	var starting_hex = new map_axial(0,0);
	
	instance_create_depth(find_hex_instance(starting_hex).x,find_hex_instance(starting_hex).y,-find_hex_instance(starting_hex)-y,obj_camera_pos);
	instance_create_depth(find_hex_instance(starting_hex).x,find_hex_instance(starting_hex).y,-find_hex_instance(starting_hex)-y,obj_player_spawn);
	repeat(8) {instance_create_depth(find_hex_instance(starting_hex).x+random_range(-20,20),find_hex_instance(starting_hex).y+random_range(-20,20),-find_hex_instance(starting_hex)-y,obj_ally_ai);}
	
	global.spawn_phase_done = true;	
	}

}