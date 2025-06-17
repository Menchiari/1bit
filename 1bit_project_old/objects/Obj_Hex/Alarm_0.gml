/// @description type of ground
sprite=choose(spr_hex_test_bg);
color=merge_color(c_ltgray,c_white,random_range(0.75,1))
alpha=random_range(.85,1);

var distance=obj_map.radius*7;
if point_distance(x,y,obj_region_center_desert.x,obj_region_center_desert.y)<distance
{
	sprite=choose(spr_bg_hex_forest2_bg,spr_bg_hex_forest3_bg);
	color=merge_color(c_black,c_white,random_range(0.4,0.5))
	alpha=random_range(.85,1);
}

if point_distance(x,y,obj_region_center_dungeon.x,obj_region_center_dungeon.y)<distance 
{
	sprite=choose(spr_bg_hex_ruins_bg,spr_bg_hex_ruins2_bg);
	color=merge_color(c_black,c_white,random_range(0.4,.5))
	alpha=random_range(.85,1);
}

if point_distance(x,y,obj_region_center_mountain.x,obj_region_center_mountain.y)<distance 
{
	sprite=choose(spr_hex_test_bg);
	color=merge_color(c_ltgray,c_white,random_range(0.75,1))
	alpha=random_range(.85,1);
}

if point_distance(x,y,obj_region_center_witch.x,obj_region_center_witch.y)<distance 
{
	sprite=choose(spr_hex_test_bg,spr_bg_hex_ruins_bg,spr_bg_hex_ruins2_bg,spr_bg_hex_forest2_bg,spr_bg_hex_forest3_bg);
	color=merge_color(c_black,c_white,random_range(0.2,.25))
	alpha=random_range(.85,1);
}

if point_distance(x,y,obj_region_center_downtown.x,obj_region_center_downtown.y)<distance 
{
	sprite=choose(spr_bg_hex_ruins_bg,spr_bg_hex_ruins2_bg);
	color=merge_color(c_black,c_white,random_range(0.4,0.5))
	alpha=random_range(.85,1);
}

if point_distance(x,y,obj_region_center_hangar.x,obj_region_center_hangar.y)<distance 
{
	sprite=choose(spr_bg_hex_ruins_bg);
	color=merge_color(c_black,c_white,random_range(0.25,.28))
	alpha=random_range(.9,1);
}

if point_distance(x,y,obj_region_center.x,obj_region_center.y)>obj_map.radius*13 
{
	sprite=choose(spr_hex_test_bg,spr_bg_hex_ruins_bg,spr_bg_hex_ruins2_bg,spr_bg_hex_forest2_bg,spr_bg_hex_forest3_bg);
	color=merge_color(c_ltgray,c_white,random_range(0.75,1))
	alpha=random_range(.85,1);
}