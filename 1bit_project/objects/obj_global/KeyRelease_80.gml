/// @description PUNISH WITH AKIRA
if global.debug==true
{

if instance_exists(obj_hero)
{
	var enemy=collision_circle(obj_hero.x,obj_hero.y,500,obj_enemy,1,1)
	if instance_exists(enemy)
	{
		with enemy
		{
			hp=-1;
			state=states.death;
		}
	}
}

}