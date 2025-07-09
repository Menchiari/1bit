/// @description look up
var target_ladder = obj_hero
if instance_exists(target_ladder)
{
	if place_meeting(x,y,target_ladder)
	{
		activate_flood=true;
	}
}
if activate_flood==true
{
	if instance_number(obj_enemy)<8
	{
		var chance=irandom_range(0,100)
		var spawn_x=285;
		var spawn_y=299;
		if chance<6
		{
			var select=irandom_range(0,2);
			switch select
			{
				case 0:
					spawn_x=285;
					spawn_y=188;
				break;
				case 1:
					spawn_x=326;
					spawn_y=190;
				break;
				case 2:
					spawn_x=183;
					spawn_y=234;
				break;
				default:
				break;
			}
			//spawn enemy
			var spawned_npc=spawn_npc_test(spawn_x,spawn_y,choose(23,23,23,24),global.NPCs);
			spawned_npc.drop_rate=0;
			spawned_npc.ai_state_original=ai_states.chase;
			if instance_exists(obj_hero) {spawned_npc.target=obj_hero;}
		}
	}
}