/// @description Insert description here
// You can write your code in this editor



if global.labyrinth_generated = true && wall_collider = false
{
	#region randomly remove wall
	var wall_sum = 0;
	for (var i = 0; i < 6; i++)
	{
		wall_sum += walls[i];
	}
	if wall_sum = 5
	{
		var rnd = irandom_range(1,2)
		if rnd = 1
		{
			do 
			{
				var rnd_wall = irandom_range(0,5);
				if walls[rnd_wall] = 1
				{
					walls[rnd_wall] = 0;
					rnd = 0;
				}
			}
			until rnd = 0
		}
	}
	else if wall_sum != 0
	{//add small random chance for all walls
	}
	
	#endregion
	
	wall_collider = true;
	for (var i =0; i < 6; i+=1){
		if walls[i] = 1{
			
			var this_wall = instance_create_depth(x,y,depth-1,obj_hex_wall);
			this_wall.image_index=i;
		}
		//else{
			
		//	//var random_event=choose(obj_ally_ai,obj_enemy,obj_enemy,obj_enemy,obj_enemy,obj_enemy,obj_enemy)
		//	//repeat(choose(0,irandom_range(0,4))){instance_create_depth(x+random_range(-80,80),y+random_range(-80,80),-y,random_event);}
		//	var chance=irandom_range(0,100);
		//	if chance<30 {
		//	spawn_npc_test(x+random_range(-180,180),y+random_range(-80,80),global.NPCs[irandom_range(3,40)])
		//	}
		//}
	}
	
}



if global.theme_assigned = true && populated = false
{

	random_set_seed(global.current_seed);
	#region Calculate Spawn Points
	
	if flat_top = true {
		var perimeter = flat_hex_perimeter(radius);
	}
	else {
		var perimeter = pointy_hex_perimeter(radius);
	}
	
	var npc_spawn_position = ds_list_create();
	var amb_spawn_position = ds_list_create();
	for (var i=0;i<6;i+=1){
		var lerp01 = 0.5;
		var new_point = new point(lerp(perimeter[i].xx,x,lerp01),lerp(perimeter[i].yy,y,lerp01));
		ds_list_insert(amb_spawn_position,i,new_point);
		
		#region rotate point to p2
		var p0 = new point(new_point.xx-x,new_point.yy-y);
		var angle = 30;
		var p1 = new point( p0.xx * dcos(angle) - p0.yy * dsin(angle) , p0.xx * dsin(angle) + p0.yy * dcos(angle) )
		var lerp02 = -0.2;
		var p2 = new point (lerp(p1.xx+x, x, lerp02 ) , lerp(p1.yy+y, y, lerp02 ) );
		#endregion
		
		ds_list_insert(npc_spawn_position,i,p2);
	}
	#endregion
	
	//temp spawn on points
	var r = irandom_range(0,1)
	//if (r < 0.5) { instance_create_depth(x,y,-y,Placeholder_AmbientLarge);}
	for (var i=0;i<6;i+=1){
		var r = irandom_range(0,1)
		//if (r < 0.5) { instance_create_depth(amb_spawn_position[| i].xx, amb_spawn_position[| i].yy , -y,Placeholder_AmbientSmall); }
		
		//var r = irandom_range(0,1)
		//if (r < 0.5) { instance_create_depth(npc_spawn_position[| i].xx, npc_spawn_position[| i].yy , -y,Placeholder_NPC); }
	}
	
	
	//spawn decor
	if theme != undefined
	{
		ds_list_shuffle(amb_spawn_position);
		
		var rnd = 5//irandom_range(0,5);
		
		var place_list = ds_list_create();
		for (var j=0; j < rnd; j++){
			ds_list_add(place_list,j);
		}
		
		ds_list_shuffle(place_list);
		
		repeat(rnd)
		{
			var dec = pick_decor(theme);
			var i = ds_list_find_value(place_list,0); //irandom_range(0,5);
			ds_list_delete(place_list,0);
			var decor =  instance_create_depth(round(amb_spawn_position[| i].xx), round(amb_spawn_position[| i].yy) , -y, obj_asset_decor);
		
			decor.sprite_index = asset_get_index(global.decor_map[dec][0])
			//todo add this depth on no_collider and just -y on the ones with collider
			decor.depth=-decor.y+decor.sprite_height;
		}
		
		ds_list_destroy(place_list);
		//ds_list_destroy()
	}
	
	//spawn npc
	if theme != undefined
	{
		
		random_set_seed(global.current_seed);
		do //spawn enemy npc using points
		{
			show_debug_message(string(global.current_seed))
			if overlapping
			{
				var rnd_npc = choose(irandom_range(theme.start,theme.finish),irandom_range(overlapping_theme.start,overlapping_theme.finish));
			}
			else
			{var rnd_npc = irandom_range(theme.start,theme.finish);}
						
			var npc = global.NPCs[rnd_npc];
			var rnd_place = irandom_range(0,5);
			var dev_x = irandom_range(-35,35);
			var dev_y = irandom_range(-50,50);
			npc_points -= npc.points;
			if npc_points < 0
			{npc_points = 0;}
		
		
			//var this_npc = instance_create_depth(npc_spawn_position[| rnd_place].xx+rnd_deviation, npc_spawn_position[| rnd_place].yy +rnd_deviation, -y,Placeholder_NPC);
			show_debug_message("Spawning @ x: "+string(npc_spawn_position[| rnd_place].xx)+"+"+string(dev_x)+" y:"+string(npc_spawn_position[| rnd_place].yy)+"+"+string(dev_y))
			
			spawn_npc_test(npc_spawn_position[| rnd_place].xx+dev_x,npc_spawn_position[| rnd_place].yy +dev_y, rnd_npc,global.NPCs);
			
			
			//this_npc.name = npc.name;
			
		
		
		}
		until (npc_points = 0)

		#region //spawn counted npc up to max per region
		
		#endregion
}
	
	//cleanup
	ds_list_destroy(npc_spawn_position);
	ds_list_destroy(amb_spawn_position);
	
	populated = true;
	
}

//x=round(x);
//y=round(y);