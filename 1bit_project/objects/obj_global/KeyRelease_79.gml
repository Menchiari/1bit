/// @description Add Enemy
if global.debug==true
{

if instance_exists(obj_hero)
{
	if keyboard_check(vk_control)
	{
		instance_create_depth(obj_hero.x-15,obj_hero.y,obj_hero.depth,obj_mercenary_var);
	}
	else
	{
		var character_type=irandom_range(3,68);
		var spawned_npc=spawn_npc_test(obj_hero.x+choose(-10,10,-15,15,-20,20,-25,25),obj_hero.y+random_range(15,-15),character_type,global.NPCs);
		spawned_npc.drop_rate=100 //spawned_npc.drop_rate*drop_rate_multiplier;
	}
}

}