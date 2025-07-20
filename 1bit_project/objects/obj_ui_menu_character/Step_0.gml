/// @description 
if mouse_check_button(mb_any) && collision_point(mouse_x,mouse_y,self,true,false) {selected=true;}
else {selected=false;}

if instance_exists(obj_hero)
{
	with(obj_hero) {scr_init_hero();}
	strength1=obj_hero.weapon.atk_dmg_light*obj_hero.str;
	strength2=(obj_hero.weapon.atk_dmg_strong+obj_hero.weapon.atk_dmg_variation)*obj_hero.str;
	resistance=obj_hero.res*(obj_hero.armor.defence+obj_hero.helm.defence);
	weight=obj_hero.armor.weight+obj_hero.helm.weight+obj_hero.weapon.weight;
	herospeed=obj_hero.spd*(1-((obj_hero.armor.weight+obj_hero.helm.weight+obj_hero.weapon.weight)/100));
}