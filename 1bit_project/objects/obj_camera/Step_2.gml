//set camera
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,vm);
if (global.widescreen)
{
	var _dw = display_get_width();
	var _dh = display_get_height();
	var _wide_w = round(global.res_y * _dw / _dh);
	camera_set_view_size(camera, _wide_w, global.res_y);
	camera_set_view_pos(camera, x - _wide_w / 2, y - global.res_y / 2);
}

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
//var _vx = camera_get_view_x(view_camera[0]);
//var _vy = camera_get_view_y(view_camera[0]);

if (x != last_cam_x || y != last_cam_y)
{
	last_cam_x=x;
	last_cam_y=y;
	
	if instance_exists(obj_character) {
	    // deactivate everything
	    instance_deactivate_object(obj_character);
	}
	var _range_multiplier=1.25;
	instance_activate_region(x-(global_res_x*_range_multiplier),y-(global_res_y*_range_multiplier),global_res_x*2*_range_multiplier,global_res_y*2*_range_multiplier,true);
	show_debug_message("Camera activating x: "+string(x-(global_res_x*_range_multiplier))+" y: "+string(y-(global_res_y*_range_multiplier))+" width: "+string(global_res_x*2*_range_multiplier)+"height: "+string(global_res_y*2*_range_multiplier));
	//var _vw = camera_get_view_width(view_camera[0]);
	//var _vh = camera_get_view_height(view_camera[0]);
	//instance_activate_region(_vx - (_range_multiplier*global_res_x/2), _vy - (_range_multiplier*global_res_y/2), _vw + (_range_multiplier*global_res_x), _vh + (_range_multiplier*global_res_y), false);
	//show_debug_message("Camera activating x: "+string(_vx - (_range_multiplier*global_res_x/2))+" y: "+string( _vy - (_range_multiplier*global_res_y/2))+" width: "+string( _vw + (_range_multiplier*global_res_x))+"height: "+string( _vh + (_range_multiplier*global_res_y)))
}