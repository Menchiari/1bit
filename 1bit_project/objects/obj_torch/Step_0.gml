/// @description
if instance_exists(obj_hero)
{
	depth=obj_hero.depth+1;
	x=obj_hero.x; y=obj_hero.y;
	life-=1/time;
}
else
{
	alarm[0]=1;
}