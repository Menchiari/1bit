/// @description
var _dust=instance_create_depth(x,y-6,depth-10,obj_fx_dustwave);
with _dust
{
	scale=.3;
	image_speed=.3;
	rot=-90
	color=c_white;
	alpha=1;
}
instance_destroy();