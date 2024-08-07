/// @description
active=true;
//dir+=random_range(-spread,spread);
alarm[1]=duration;

repeat(bullets-1)
{
	var bullet=instance_create_depth(x,y,depth,obj_bullet)
	bullet.spread=spread;
	bullet.faction=faction;	
	bullet.destx=destx+random_range(-spread,spread);
	bullet.desty=desty+random_range(-spread,spread);

	bullet.damage=damage;
	bullet.damage_variation=damage_variation;
}

destx+=random_range(-spread,spread);
desty+=random_range(-spread,spread);