/// @description immediately reactivate obj_hero to keep it safe
if instance_exists(obj_hero) {instance_activate_object(obj_hero);}
else
{
	if !instance_exists(obj_death)
	&& room!=rm_story_caves
	&& room!=rm_story_AI_2
	{instance_create(obj_hero);}
}
alarm[0]=irandom_range(10,20);