// Character scripts
function scr_flip_check_mouse(destx,desty,dir_scale)
{
	if destx < x {dir=1*dir_scale};
	else {dir=-1*dir_scale};
	if desty < y-6 {back=true};
	else {back=false};
}

function scr_character_move(destx,desty,speed,checkradius)
{
	//todo double check how to make path only when collision is between xy and destxy
	//movement by path if encountering collision
	if point_distance(x,y,dest_x,dest_y)>run_distance_enemy || collision_circle(x,y,run_distance_enemy,obj_enemy,true,true) || collision_line(x,y,dest_x,dest_y,obj_avoid,true,true)
	{
		if mp_potential_path_object(walking_path,dest_x,dest_y,speed,4,obj_avoid)
		&& point_distance(x,y,dest_x,dest_y)>speed+checkradius
		{
			path_set_precision(walking_path,6)
			path_start(walking_path,speed*2*walk_sp_mod,0,0)
		}
		else
		{
			path_end();
			state=states.idle;
		}
	}
	//direct step movement if no collision is in the way
	else
	{
		if mp_potential_step_object(destx,desty,speed,obj_avoid)
		//|| collision_circle(x+lengthdir_x(player_radius*checkradius,direction),y+lengthdir_y(player_radius*checkradius,direction),player_radius,obj_avoid,true,true)
		{
			path_end();
			state=states.idle
		}
	}
}
