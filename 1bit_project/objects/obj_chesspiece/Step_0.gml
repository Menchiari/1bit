/// @description
depth=-y;
switch current_state
{
	case "wait":
		switch chess_piece
		{
			case "pawn":
				damage=3;
				image_index=0;
				if collision_circle(x+sq_w,y+sq_h,radius,target_always,true,true){dest_x=x+sq_w;dest_y=y+sq_h;current_state="attack";}
				if collision_circle(x-sq_w,y+sq_h,radius,target_always,true,true){dest_x=x-sq_w;dest_y=y+sq_h;current_state="attack";}
			break;
			case "knight":
				image_index=1;
				damage=4;
				if collision_circle(x+sq_w,y-sq_h*2,radius,target_always,true,true){dest_x=x+sq_w;dest_y=y-sq_h*2;current_state="attack";}
				if collision_circle(x+sq_w*2,y-sq_h,radius,target_always,true,true){dest_x=x+sq_w*2;dest_y=y-sq_h;current_state="attack";}
				if collision_circle(x+sq_w*2,y+sq_h,radius,target_always,true,true){dest_x=x+sq_w*2;dest_y=y+sq_h;current_state="attack";}
				if collision_circle(x+sq_w,y+sq_h*2,radius,target_always,true,true){dest_x=x+sq_w;dest_y=y+sq_h*2;current_state="attack";}
				if collision_circle(x-sq_w,y+sq_h*2,radius,target_always,true,true){dest_x=x-sq_w;dest_y=y+sq_h*2;current_state="attack";}
				if collision_circle(x-sq_w*2,y+sq_h,radius,target_always,true,true){dest_x=x-sq_w*2;dest_y=y+sq_h;current_state="attack";}
				if collision_circle(x-sq_w*2,y-sq_h,radius,target_always,true,true){dest_x=x-sq_w*2;dest_y=y-sq_h;current_state="attack";}
				if collision_circle(x-sq_w,y-sq_h*2,radius,target_always,true,true){dest_x=x-sq_w;dest_y=y-sq_h*2;current_state="attack";}
			break;
		}
	break;
	case "attack":
		if point_distance(x,y,dest_x,dest_y)>radius {move_towards_point(dest_x,dest_y,atk_speed);}
		else {current_state="damage";}
	break;
	case "damage":
		instance_create(obj_fx_blood);
		instance_destroy();
	break;
}

if collision_circle(x,y,radius+speed,target_attack,true,true)
{
	scr_attack_system(image_index,radius+speed,damage,0,damage,2);
	current_state="damage";
}