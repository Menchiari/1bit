// Character scripts
function scr_flip_check_mouse(destx,desty,dir_scale)
{
	if destx < x {dir=1*dir_scale};
	else {dir=-1*dir_scale};
	if desty < y-6 {back=true};
	else {back=false};
}

function scr_check_destination_edge()
{
	var margin = 32;
	var offset = 16; // how far past the edge to push

	// Get current active camera from active view
	var cam = view_camera[0]; // assuming view 0 is always active

	// Get view bounds in room space
	var vx = camera_get_view_x(cam);
	var vy = camera_get_view_y(cam);
	var vw = camera_get_view_width(cam);
	var vh = camera_get_view_height(cam);

	// Push click only if it's near the edge
	if (dest_x >= vx && dest_x <= vx + margin) {
	    dest_x = vx - offset; // Left edge
	}
	else if (dest_x >= vx + vw - margin && dest_x <= vx + vw) {
	    dest_x = vx + vw + offset; // Right edge
	}

	if (dest_y >= vy && dest_y <= vy + margin) {
	    dest_y = vy - offset; // Top edge
	}
	else if (dest_y >= vy + vh - margin && dest_y <= vy + vh) {
	    dest_y = vy + vh + offset; // Bottom edge
	}

	show_debug_message(string(dest_x)+" click x, "+string(dest_y)+" click y")
	show_debug_message(string(x)+" hero x, "+string(y)+" hero y")
}

function scr_character_move(destx,desty,_speed,checkradius)
{
	speed = 0;	// path movement handles this
	var dist = point_distance(x, y, destx, desty);
	if (dist > _speed + checkradius && mp_grid_path(global.pathfinding_grid, walking_path, x, y, destx, desty, true))
	{
		path_start(walking_path, _speed * 2 * walk_sp_mod, path_action_stop, 0);
	}
	else
	{
		path_end();
		state = states.idle;
		if (ai_state != ai_states.search && ai_state != ai_states.wander) {
			dest_x = x;
			dest_y = y;
		}
	}
	//}
	//else
	//{
	//	// STEP MOVEMENT: Only if safe direct path available
	//	if (mp_potential_step_object(destx, desty, _speed, obj_avoid))
	//	{
	//		path_end();
	//		state = states.idle;
	//	}
	//}
	////todo double check how to make path only when collision is between xy and destxy
	////movement by path if encountering collision
	//if point_distance(x,y,dest_x,dest_y)>run_distance_enemy || collision_circle(x,y,run_distance_enemy,obj_enemy,true,true) || collision_line(x,y,dest_x,dest_y,obj_avoid,true,true)
	//{
	//	if mp_potential_path_object(walking_path,dest_x,dest_y,speed,4,obj_avoid)
	//	&& point_distance(x,y,dest_x,dest_y)>speed+checkradius
	//	{
	//		path_set_precision(walking_path,6)
	//		path_start(walking_path,speed*2*walk_sp_mod,0,0)
	//	}
	//	else
	//	{
	//		path_end();
	//		state=states.idle;
	//	}
	//}
	////direct step movement if no collision is in the way
	//else
	//{
	//	if mp_potential_step_object(destx,desty,speed,obj_avoid)
	//	//|| collision_circle(x+lengthdir_x(player_radius*checkradius,direction),y+lengthdir_y(player_radius*checkradius,direction),player_radius,obj_avoid,true,true)
	//	{
	//		path_end();
	//		state=states.idle
	//	}
	//}
}
