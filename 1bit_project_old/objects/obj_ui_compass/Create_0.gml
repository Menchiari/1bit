/// @description Insert description here
// You can write your code in this editor
r=6;


target[0] = obj_region_center_dungeon;
target[1] = obj_region_center_witch;
target[2] = obj_region_center_mountain;
target[3] = obj_region_center_desert;
target[4] = obj_region_center_downtown;
target[5] = obj_region_center_hangar;

max_distance = (obj_map.map_size*2+1) * obj_map.radius;


for (var i = 0; i < 6; i++;)
{
	target_dist[i] = 0;
	target_dir[i] = 0;
	target_blink[i] = 0;
	alarm[i]=1;
}

