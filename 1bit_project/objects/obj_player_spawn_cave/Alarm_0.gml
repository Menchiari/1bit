/// @description teleport hero
if instance_exists(obj_hero)
{
	if instance_number(obj_hero)>1 {instance_destroy(obj_hero);}
	start_anim=true;
}