/// @description switch Factions
if instance_exists(obj_hero)
{
	with obj_hero
	{
		if faction=factions.ally {faction=factions.enemy;}
		else if faction=factions.enemy {faction=factions.ally;}
		else {faction=factions.enemy}
	}
}
