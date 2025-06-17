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

if instance_exists(obj_hero) && instance_exists(obj_camera_pos)
{
	if point_distance(obj_hero.x,obj_hero.y,instance_nearest(obj_hero.x,obj_hero.y,obj_camera_pos).x,instance_nearest(obj_hero.x,obj_hero.y,obj_camera_pos).y)<global.res_x*.4
	{follow=instance_nearest(obj_hero.x,obj_hero.y,obj_camera_pos);}
	else
	{follow=obj_hero;}
}

instance_activate_region(x-(global.res_x*2),y-(global.res_y*2),global.res_x*4,global.res_y*4,true);