depth=-y;
x=round(x);
y=round(y);
var distance=obj_map.radius*8;
if point_distance(x,y,obj_region_center_desert.x,obj_region_center_desert.y)<distance {sprite_index=spr_elements_trees_palms}
else if point_distance(x,y,obj_region_center_dungeon.x,obj_region_center_dungeon.y)<distance {sprite_index=spr_elements_trees_ruins}
else if point_distance(x,y,obj_region_center_mountain.x,obj_region_center_mountain.y)<distance {sprite_index=spr_elements_trees}
else if point_distance(x,y,obj_region_center_witch.x,obj_region_center_witch.y)<distance {sprite_index=spr_elements_trees_winter}
else if point_distance(x,y,obj_region_center_downtown.x,obj_region_center_downtown.y)<distance {sprite_index=spr_elements_trees_city}
else if point_distance(x,y,obj_region_center_hangar.x,obj_region_center_hangar.y)<distance {sprite_index=spr_elements_trees_hangar}
else {instance_destroy();}

image_index=irandom_range(0,image_number-1);