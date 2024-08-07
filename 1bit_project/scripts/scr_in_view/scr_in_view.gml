// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_in_view(_x,_y,_offsetx,_offsety){
	if instance_exists(obj_camera)
	{
		if _x>obj_camera.x-global.res_x/2+_offsetx
		&& _x<obj_camera.x+global.res_x/2-_offsetx
		&& _y>obj_camera.y-global.res_y/2+_offsety
		&& _y<obj_camera.y+global.res_y/2-_offsety
		{return true;}
		else
		{return false;}
	}
}