/// @description 
if instance_exists(obj_hero)
{
	if type=0 {text="you have found a "+obj_hero.weapon.name;}
	if type=1 {text="you have found a "+obj_hero.armor.name;}
	if type=2 {text="you have found a "+obj_hero.helm.name;}
}