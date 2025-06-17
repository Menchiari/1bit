/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

x=room_width/2;
y=room_height/2;

//hex config
flat_top = true;
radius = 225;//180//290//170//180;
global.HexSpacing = 0//2;
global.LineWidth = 0//2;
//map config
map_size = 9//4;
global.labyrinth_generated = false;
global.theme_assigned = false;
global.spawn_phase_done = false;
axial_directions = [new map_axial(+1, 0), new map_axial(+1, -1), new map_axial(0, -1), new map_axial(-1, 0), new map_axial(-1, +1), new map_axial(0, +1)]



////map generation
#region Generate blank Map
var this_hex = new map_cube(0,0,0);
for (var i = -map_size; i <=map_size; i+=1){
	for (var j = -map_size; j <=map_size; j+=1){
		for (var k = -map_size; k <=map_size; k+=1){
			if (i+j+k = 0)
			{
				this_hex.xx = i; this_hex.yy = j; this_hex.zz = k;
				print("Generating Blank:"+string(this_hex.xx)+","+string(this_hex.yy)+","+string(this_hex.zz));
				var new_cell = cube_to_axial(this_hex);
				print("Cell xy: "+string(new_cell.r)+" "+string(new_cell.q));
				
				
				map_grid[new_cell.r+map_size,new_cell.q+map_size] = spawn_hex(new_cell.r,new_cell.q,radius,flat_top);
			}
		}	
	}	
}
#endregion
//begining cell for generation
current_hex = new map_axial(0,0);
map_stack = ds_stack_create();
dir_stack = ds_stack_create();
next_hex = undefined;
last_dir = 0;
last_hex = undefined;


//var dir = 3 ;
//set_hex_wall(current_hex,dir,1)
//find_hex_instance(hex_neighbor(current_hex,dir)).HexColor = c_purple;

//find_hex_instance(current_hex).visited = true;
	
//test bullshit

//var test = new map_axial(0,-4)	
//var instance_test = find_hex_instance(test);
//instance_test.HexColor = c_green;

//instance_test = find_hex_instance(find_next_hex());
//instance_test.HexColor = c_purple;

//set_hex_wall(test,0,0);
//for (var i = 0; i<6; i+=1)
//{
//	var instance_test = find_hex_instance(hex_neighbor(test,i));
//	if instance_test != undefined
//	{
//		instance_test.HexColor = c_teal;
//	}
//}

//alarm[0] = 10; 