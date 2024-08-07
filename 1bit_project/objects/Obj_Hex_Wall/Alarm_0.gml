switch image_index
{
	case 0:
		var pointax=487;
		var pointay=600;
		var pointbx=625;
		var pointby=368;
	break;
	case 1:
		var pointax=600;
		var pointay=339;
		var pointbx=402;
		var pointby=90;
	break;
	case 2:
		var pointax=453;
		var pointay=68;
		var pointbx=171;
		var pointby=65;
	break;
	case 3:
		var pointax=173;
		var pointay=89;
		var pointbx=46;
		var pointby=325;
	break;
	case 4:
		var pointax=27;
		var pointay=345;
		var pointbx=171;
		var pointby=603;
	break;
	case 5:
		var pointax=163;
		var pointay=602;
		var pointbx=490;
		var pointby=609;
	break;
}

//depth=-y+lerp(pointay,pointby,.5)-320;
//depth=-y+sprite_height/2.25
repeat(amount)
{
	var randompos=random_range(0,1);
	var randomposx=lerp(pointax,pointbx,randompos);
	var randomposy=lerp(pointay,pointby,randompos);
	var randomoffset=random_range(.9-offset,.9);
	var randomoffsetx=lerp(0,randomposx,randomoffset)
	var randomoffsety=lerp(0,randomposy,randomoffset)
	instance_create_depth(x+randomoffsetx-320,y+randomoffsety-320,-y,obj_elements_tree);
}

var distance=obj_map.radius*7;
if point_distance(x,y,obj_region_center_desert.x,obj_region_center_desert.y)<distance {sprite_index=spr_hex_walls_empty;}
if point_distance(x,y,obj_region_center_dungeon.x,obj_region_center_dungeon.y)<distance {sprite_index=choose(spr_hex_walls_ruins,spr_hex_walls_ruins_broken);}
if point_distance(x,y,obj_region_center_mountain.x,obj_region_center_mountain.y)<distance {sprite_index=choose(spr_hex_walls,spr_hex_walls_wood,spr_hex_walls_ruins);}
if point_distance(x,y,obj_region_center_witch.x,obj_region_center_witch.y)<distance {sprite_index=spr_hex_walls_wood;}
if point_distance(x,y,obj_region_center_downtown.x,obj_region_center_downtown.y)<distance {sprite_index=choose(spr_hex_walls);}
if point_distance(x,y,obj_region_center_hangar.x,obj_region_center_hangar.y)<distance {sprite_index=choose(spr_hex_walls,spr_hex_walls_ruins);}
if point_distance(x,y,obj_region_center.x,obj_region_center.y)>obj_map.radius*13 {sprite_index=spr_hex_walls;}