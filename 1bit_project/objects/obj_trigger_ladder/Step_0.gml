/// @description look up
var target_ladder = instance_place(x,y,obj_character);
if instance_exists(target_ladder)
{
	if place_meeting(x,y,target_ladder)
	{
		target_ladder.ladder = true;
		show_debug_message("back");
	}
}