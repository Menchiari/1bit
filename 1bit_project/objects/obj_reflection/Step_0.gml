if instance_exists(obj_hero)
{
	if collision_circle(x,y,radius,obj_hero,true,true)
	{
		scr_attack_system(round(image_index),radius+speed,damage,0,damage,2);
		instance_create(obj_fx_blood);
		instance_destroy();
	}
	
	x=obj_hero.x;
	y=room_height+(-obj_hero.y)-y_offset;
	dir=obj_hero.dir;
	back=obj_hero.back;
	tposx=obj_hero.tposx;
	tposy=obj_hero.tposy;
	size=obj_hero.size;
	image_index=obj_hero.image_index;
	
	sprite_body=obj_hero.sprite_body;
	sprite_back=obj_hero.sprite_back;
	helm.sprite=obj_hero.helm.sprite;
	sprite_skin=obj_hero.sprite_skin;
	character_head=obj_hero.character_head;
	color=obj_hero.color;
}
else {instance_destroy();}

//if !instance_exists(obj_door_mirror) {instance_destroy();}