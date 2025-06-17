var enemy=collision_circle(x,y,500,obj_enemy,1,1)
if instance_exists(enemy)
{
	with enemy
	{
		hp=-1;
		state=states.death;
	}
}