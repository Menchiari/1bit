/// @description 
if mouse_check_button(mb_any) && collision_point(mouse_x,mouse_y,self,true,false) {selected=true;}
else {selected=false;}

if instance_exists(hero)
{
	with hero {scr_init_hero();}
	strength1=hero.weapon.atk_dmg_light;
	strength2=hero.weapon.atk_dmg_strong;
	resistance=hero.res*(hero.armor.defence+hero.helm.defence);
	weight=hero.armor.weight+hero.helm.weight+hero.weapon.weight;
}