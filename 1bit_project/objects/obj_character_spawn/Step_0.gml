/// @description
if instance_exists(obj_hero)
{
	if point_distance(x,y,obj_hero.x,obj_hero.y)<activation_range && once==true
	{
		alarm[0]=1;
		once=false;
	}
	//todo try to destroy if very far
	//if instance_exists(spwn_spawned_npc)
	//{
	//	if point_distance(spwn_spawned_npc.x,spwn_spawned_npc.y,obj_hero.x,obj_hero.y)>deactivation_range
	//	{
	//		instance_destroy(spwn_spawned_npc)
	//		once=true;
	//	}
	//}
}