scr_init_character();
if instance_exists(obj_hero)
{
	sprite_body=obj_hero.sprite_body;
	sprite_back=obj_hero.sprite_back;
	helm.sprite=obj_hero.helm.sprite;
	sprite_skin=obj_hero.sprite_skin;
	character_head=obj_hero.character_head;
	color=obj_hero.color;
}

radius=speed*2;
damage=3;
y_offset=70;
faction=factions.neutral;