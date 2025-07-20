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
if instance_exists(obj_character)
{
    // deactivate everything
    instance_deactivate_object(obj_character);
}
// activate region around the camera
instance_activate_region(x-global_res_x-(global_res_x/2),y-global_res_y-(global_res_y/2),x+global_res_x+(global_res_x/2),y+global_res_y+(global_res_y/2),true);
