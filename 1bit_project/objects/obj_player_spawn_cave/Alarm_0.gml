/// @description teleport hero
if instance_exists(obj_hero)
{
	start_anim=true;
}
if instance_number(obj_hero)>1
{
	show_debug_message("WARNING! MORE THAN ONE HERO!!!");
}