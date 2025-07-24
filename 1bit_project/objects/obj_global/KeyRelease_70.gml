/// @description
if instance_exists(obj_hero)
{
	with obj_hero
	{
		if faction=factions.ally {faction=factions.enemy;}
		if faction=factions.enemy {faction=factions.ally;}
	}
}
