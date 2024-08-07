if active==true
{
	move_towards_point(destx,desty,spd);
	if point_distance(x,y,destx,desty)<=spd
	{
		speed=0;
		x=destx;
		y=desty;
		alarm[1]=1;
	}
	//motion_set(dir,spd);
	//if dir>=360 {dir-=360}
	//var victim=collision_line(x,y,xprevious,yprevious,obj_character,true,true)
	//if victim==true && hit==false
	//{
	//	hit=true;
	//	x=victim.x;
	//	y=victim.y;
	//	alarm[1]=1;
	//}
	//if collision_line(x,y,xprevious,yprevious,obj_breakable,true,true)
	//{
	//	x=obj_breakable.x;
	//	y=obj_breakable.y;
	//	scr_attack_system(image_index,-1,damage,damage_variation,damage/10,1);
	//	instance_destroy();
	//}
}