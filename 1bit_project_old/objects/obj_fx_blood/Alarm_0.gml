if bodyspawn==true
{
	instance_create_depth(x,y,-y,obj_fx_splash);
	repeat(irandom_range(6,10)) {instance_create_depth(x,y,-y,obj_fx_bodypart);}
}