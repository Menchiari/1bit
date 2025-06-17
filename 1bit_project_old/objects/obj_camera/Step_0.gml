x+=(xto-x)/cam_smooth;
y+=(yto-y)/cam_smooth;

if instance_exists(follow)
{
	if follow!=noone
	{
		xto=follow.x;
		yto=follow.y;
	}
}

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,vm);

//if instance_exists(obj_hero) && instance_exists(obj_camera_pos)
//{
//	if point_distance(obj_hero.x,obj_hero.y,instance_nearest(obj_hero.x,obj_hero.y,obj_camera_pos).x,instance_nearest(obj_hero.x,obj_hero.y,obj_camera_pos).y)<global.res_x*.4
//	{follow=instance_nearest(obj_hero.x,obj_hero.y,obj_camera_pos);}
//	else
//	{follow=obj_hero;}
//}

if instance_exists(obj_hero)
{
	var gapx=24;
	var gapy=32;
	if obj_hero.x<x-(global.res_x/2)+gapx/2 && mouse_x<x-(global.res_x/2)+gapx/2 {obj_hero.dest_x=x-(global.res_x/2)-gapx-1; obj_hero.dest_y=obj_hero.y;}
	if obj_hero.x>x+(global.res_x/2)-gapx/2 && mouse_x>x+(global.res_x/2)-gapx/2 {obj_hero.dest_x=x+(global.res_x/2)+gapx+1; obj_hero.dest_y=obj_hero.y;}
	if obj_hero.y<(y-global.res_y/2)+gapy/2 && mouse_y<(y-global.res_y/2)+gapy/2 {obj_hero.dest_y=y-(global.res_y/2)-gapy-1; obj_hero.dest_x=obj_hero.x;}
	if obj_hero.y>(y+global.res_y/2)-gapy/2 && mouse_y>(y+global.res_y/2)-gapy/2 {obj_hero.dest_y=y+(global.res_y/2)+gapy+1; obj_hero.dest_x=obj_hero.x;}
		
	if instance_exists(obj_camera_pos) && obj_hero.state=states.idle
	{
		//reposition the camera
		var newcam=instance_nearest(obj_hero.x,obj_hero.y,obj_camera_pos);
		x=newcam.x;
		y=newcam.y;
		
		if obj_hero.x<x-(global.res_x/2) {x=x-global.res_x;}
		if obj_hero.x>x+(global.res_x/2) {x=x+global.res_x;}
		if obj_hero.y<(y-global.res_y/2) {y=y-global.res_y;}
		if obj_hero.y>(y+global.res_y/2) {y=y+global.res_y;}
	}
	
	if point_distance(x,y,xprevious,yprevious)>global.res_x/3
	{
		instance_create(obj_fx_fadein_fast);
	}
	
	//var camera_position=collision_point(obj_hero.dest_x,obj_hero.dest_y,obj_camera_pos,false,true)
	//if instance_exists(camera_position)
	//{
	//	if point_in_rectangle(obj_hero.x,obj_hero.y,camera_position.x+gapx,camera_position.y+gapy,camera_position.x+global.res_x-gapx,camera_position.y+global.res_y-gapy)
	//	{
	//		x=camera_position.x;
	//		y=camera_position.y;
	//	}
	//}
}

instance_deactivate_object(obj_character);
instance_activate_region(x-(global.res_x*2),y-(global.res_y*2),global.res_x*4,global.res_y*4,true);
