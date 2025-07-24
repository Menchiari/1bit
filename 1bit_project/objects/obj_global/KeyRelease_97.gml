/// @description Give player weapon
if instance_exists(obj_hero)
{
	with obj_hero
	{
		equip_weapon(global.weapons[52]);
	}
}
