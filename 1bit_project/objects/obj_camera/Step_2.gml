//set camera
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,vm);

//follow camera
if followcam==true
{
	if instance_exists(obj_hero)
	{
		if instance_exists(obj_camera_pos)
		{
			follow=instance_nearest(obj_hero.x,obj_hero.y,obj_camera_pos);
			if point_distance(follow.x,follow.y,obj_hero.x,obj_hero.y)>follow.sprite_height/2
			{follow=obj_hero;}
		}
		else {follow=obj_hero;}
	}

	if instance_exists(follow)
	{
		x+=(xto-x)/cam_smooth;
		y+=(yto-y)/cam_smooth;

		if follow!=noone
		{
			xto=follow.x;
			yto=follow.y;
		}
	}
}
else
{
	if instance_exists(obj_hero)
	{
		if instance_exists(obj_camera_pos)
		{
			//reposition the camera
			var newcam=instance_nearest(obj_hero.x,obj_hero.y,obj_camera_pos);
			x=newcam.x;
			y=newcam.y;
			
			if autoreposition==true
			{
				if obj_hero.x<x-(global_res_x/2) {x=x-global_res_x;}
				if obj_hero.x>x+(global_res_x/2) {x=x+global_res_x;}
				if obj_hero.y<(y-global_res_y/2) {y=y-global_res_y;}
				if obj_hero.y>(y+global_res_y/2) {y=y+global_res_y;}
			}
		}
	
		if point_distance(x,y,xprevious,yprevious)>global_res_x/3
		{
			instance_create(obj_fx_fadein_fast);
			init_pathfinding_grid();
		}
	}
}

//////////////////////////////////////////////////////////////////////////////
/////////////////////////////////OPTIMIZATION/////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
// optimization
// activate region around the camera
var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);

if (_vx != last_cam_x || _vy != last_cam_y)
{
	if instance_exists(obj_character)
	{
	    // deactivate everything
	    instance_deactivate_object(obj_character);
	}
	var _range_multiplier=2;
	var _vw = camera_get_view_width(view_camera[0]);
	var _vh = camera_get_view_height(view_camera[0]);
	instance_activate_region(_vx - (_range_multiplier*global_res_x/2), _vy - (_range_multiplier*global_res_y/2), _vw + (_range_multiplier*global_res_x), _vh + (_range_multiplier*global_res_y), false);
}