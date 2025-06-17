// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function __HEX_MAP_SYS(){

}

function point (_x,_y) constructor{
xx=_x;
yy=_y;
}

function map_axial (_q,_r) constructor{
q=_q;
r=_r;
}



function flat_hex_perimeter(size) constructor{
	
	var HexP = array_create(6);
	for (var i =1; i <=6; i+=1){
	var angle_deg = 60 * i
	HexP[i-1] = new point(x + size * dcos(angle_deg), y + size * dsin(angle_deg))
	}
	return HexP;
}

function pointy_hex_perimeter(size)constructor{
    
	var HexP = array_create(6);
	for (var i =1; i <=6; i+=1){
	var angle_deg = 60 * i - 30
	HexP[i-1] = new point(x + size * dcos(angle_deg), y + size * dsin(angle_deg))
	}
	return HexP;
}

function map_cube(_x,_y,_z) constructor{
	xx = _x;
	yy = _y;
	zz = _z;
}

function spawn_hex(_r,_q,_radius,_flat_top) constructor{
	var this_hex = instance_create_depth(x,y,0,obj_hex);
	this_hex.radius = _radius;
	this_hex.axial.r = _r;
	this_hex.axial.q = _q;
	this_hex.flat_top = _flat_top;
	this_hex.theme = undefined// new theme_strct("-blank-",0,0)
	this_hex.npc_points = 0 ;

	
	if _flat_top = true {
		
		this_hex.x = round(x + (_radius + global.HexSpacing) * ( 3/2 * _q ));	
		this_hex.y = round(y + (_radius + global.HexSpacing) * (sqrt(3)/2 * _q  +  sqrt(3) * _r));
		
	}
	else {
		
		this_hex.x = round(x + (_radius + global.HexSpacing) * (sqrt(3) * _q  +  sqrt(3)/2 * _r));	
		this_hex.y = round(y + (_radius + global.HexSpacing) * (3/2 * _r));
		
	}
	//instance_create_depth(this_hex.x,this_hex.y,0,obj_camera_pos);
		
	return this_hex;
	
}

function cube_to_axial(_cube){
	var _axial = new map_axial(_cube.xx,_cube.zz);
	return _axial;
}

function axial_to_cube(_axial){
	var _cube = new map_cube(_axial.q, (-_axial.q-_axial.r), _axial.r);
	return _cube;
}

function find_hex_instance(_axial) constructor{
	try {
	return map_grid[_axial.r+map_size,_axial.q+map_size];}
	catch(e)
	{
		return undefined;
	}
	
}


function rotate_coord(_axial) constructor 
{
	var cube = axial_to_cube(_axial);	
	var rot_cube = new map_cube(-cube.zz, -cube.xx, -cube.yy);
	return cube_to_axial(rot_cube);
}


function hex_direction(direction) constructor {
    return axial_directions[direction]
}

function hex_neighbor(hex, direction) constructor {
    var dir = hex_direction(direction)
	if (abs(hex.q +dir.q) <= map_size && abs(hex.r + dir.r) <= map_size)
    {return new map_axial(hex.q + dir.q, hex.r + dir.r)}
	else {return undefined}
}

function set_hex_wall(_axial,_direction,_wall) constructor {
		var this_hex = find_hex_instance(_axial);
		if this_hex != undefined
		{this_hex.walls[_direction] = _wall;}
	}


function find_next_hex() constructor {

if current_hex != undefined {
	
	var rnd = ds_list_create();

	for (var i = 0; i<6; i+=1)
	{
		var ngbr_hex_axial = hex_neighbor(current_hex,i)
		if ngbr_hex_axial != undefined 
		{	
			var	neighbor_hex = find_hex_instance(ngbr_hex_axial)
			if neighbor_hex != undefined && neighbor_hex  != 0 {
				//print(string(neighbor_hex))
				if neighbor_hex.visited = false
				{
					var this_entry = new point(i, ngbr_hex_axial)
						ds_list_add(rnd,this_entry);
				}
			}
		}
	}
	if !ds_list_empty(rnd)
	{
		ds_list_shuffle(rnd);
		var n = ds_list_find_value(rnd,0);
		ds_list_destroy(rnd);
		last_dir = n.xx;
		return n.yy;
	}
	else
	{
		return undefined;
	}

	}
	else
	{return undefined}

}


function remove_walls() constructor {

set_hex_wall(current_hex,last_dir,0);
set_hex_wall(next_hex,inverse_direction(last_dir),0);


}

function inverse_direction( _direction) constructor {
	
	if _direction = 0 return 3;
	if _direction = 1 return 4;
	if _direction = 2 return 5;
	if _direction = 3 return 0;
	if _direction = 4 return 1;
	if _direction = 5 return 2;
	
}



function theme_strct(_name, _start, _finish, _count) constructor {
	name = _name;
	start = _start;
	finish = _finish;
}

function hex_ring(_center,_radius,_theme, _ring_points ,_color) constructor{
	
	var ring_list = ds_list_create();
	var start_displacement = map_axial_scale(axial_directions[4],_radius)
	var nextHex = new map_axial(_center.q+start_displacement.q, _center.r+start_displacement.r)
	var nextHexInst = undefined;
	
	for (var i=0; i<6; i++){
		for (var j=0; j<_radius; j++){
			nextHex = hex_neighbor(nextHex,i)
			nextHexInst = find_hex_instance(nextHex)
			if nextHexInst != undefined{
				if nextHexInst.theme = undefined {
				nextHexInst.theme=new theme_strct(_theme.name,_theme.start,_theme.finish);
				}
				else 
				{
					nextHexInst.overlapping = true;
					nextHexInst.overlapping_theme = new theme_strct(_theme.name,_theme.start,_theme.finish);
				}
				nextHexInst.npc_points=_ring_points/(6*_radius)
				ds_list_add(ring_list,nextHexInst);
				nextHexInst.HexColor = _color
				
			}
		}
	}
	#region remove walls from 1st ring
	for (var t = 0; t<6; t+=1)
	{
		var this_hex = hex_neighbor(_center,t)
		for (var i = 0; i<6; i+=1)
		{
			set_hex_wall(this_hex,i,0);
			set_hex_wall(hex_neighbor(this_hex,i),inverse_direction(i),0);
		}	
	}
	#endregion

	#region spawn npc count
	
	//find theme 
	var theme_c = undefined;
	for (var i = 0; i < ds_list_size(global.theme_count_list); i++)
	{
		theme_c = ds_list_find_value(global.theme_count_list,i);
		if theme_c.name = _theme.name
		{break;}
	}
	if theme_c = undefined
	{ds_list_destroy(ring_list); exit;}
	
	//
	var npc_list_copy = array_create(0);
	
	for (var i = theme_c.start; i <= theme_c.finish; i++)
	{
		//copy spawnable npc in the area to avoid altering original list and messing things up on respawn
		var npc = global.NPC_count[i];
		var npc_copy = new npc_struct(
						npc.obj_name,
						npc.name,
						npc.hp,
						npc.str,
						npc.res,
						npc.spd,
						npc.cha,
						npc.weapon,
						npc.armor,
						npc.helm,
						npc.theme,
						npc.points,
						npc.count)
		if npc_copy.count != 0
		{array_push(npc_list_copy,npc_copy);}
	}

	do
	{
		var tot_npc = 0
		for (var i =0; i < array_length(npc_list_copy); i++)
		{
			var this_npc_count = npc_list_copy[i].count;
			if this_npc_count = 0
			{array_delete(npc_list_copy,i,1);}
			else
			{tot_npc += this_npc_count;}
		}
		if tot_npc = 0
		{break;}
		
		ds_list_shuffle(ring_list);
		
		var rnd_hex = ds_list_find_value(ring_list,0);
		var rnd_npc = irandom_range(0,array_length(npc_list_copy)-1);
		npc_list_copy[rnd_npc].count -= 1;
		
		//SUPERTEMP!
		spawn_npc_test(rnd_hex.x,rnd_hex.y,rnd_npc,npc_list_copy);
		
		show_debug_message("Spawning counted npc; this kind remaining" + string(npc_list_copy[rnd_npc].count))
		
		
	}
	until(tot_npc = 0)
	
	#endregion
	//cleanup
	ds_list_destroy(ring_list);
	array_delete(npc_list_copy,0,array_length(npc_list_copy));
}



function map_cube_scale(_cube, _scale) constructor{
	return new map_cube(_cube.xx*_scale,_cube.yy*_scale,_cube.zz*_scale)
}

function map_axial_scale(_axial, _scale) constructor{
	return new map_axial(_axial.q*_scale,_axial.r*_scale)
}


function region_struct(_outer_theme, _middle_theme, _inner_theme) constructor {

	outer  =  _outer_theme;
	middle = _middle_theme;
	inner  =  _inner_theme;

}


function create_region(_center, _region, _points) constructor{

	var region_color = make_color_rgb(irandom_range(0,255),irandom_range(0,255),irandom_range(0,255))

	var center_obj;
	
	switch (_region.inner.name)
	{
		case "06_castle_dungeon": center_obj = obj_region_center_dungeon; break;
		case "09_witch_town": center_obj = obj_region_center_witch; break;
		case "12_mountains": center_obj = obj_region_center_mountain; break;
		case "15_desert": center_obj = obj_region_center_desert; break;
		case "18_city_downtown": center_obj = obj_region_center_downtown; break;
		case "21_hangar": center_obj = obj_region_center_hangar; break;
		default: center_obj = obj_null; break;
	}

	var cntrHex = find_hex_instance(_center);
	if cntrHex != undefined{
		cntrHex.theme = new theme_strct(_region.inner.name,_region.inner.start,_region.inner.finish);		
		for (var i = 0; i<6; i+=1)
		{
			set_hex_wall(_center,i,0);
			set_hex_wall(hex_neighbor(_center,i), inverse_direction(i) ,0);
		}
		instance_create_depth(cntrHex.x,cntrHex.y,-y,center_obj);

	}
	hex_ring(_center,1,_region.inner,_points,region_color);
	hex_ring(_center,2,_region.middle,_points,region_color);
	hex_ring(_center,3,_region.outer,_points,region_color);
	
}





function print (some_string) constructor {
show_debug_message(some_string)
}