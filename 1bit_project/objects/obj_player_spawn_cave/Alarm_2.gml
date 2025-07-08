/// @description deactivate hero
if instance_exists(obj_hero)
{
	obj_hero.x=x;obj_hero.y=y;
	obj_hero.state=states.null;
	obj_hero.speech_text="";
	obj_hero.speed=0;
	with (obj_hero) {visible = false;}
	depth=obj_hero.depth;
	alarm[0]=time_before_activating;
}
else
{
	instance_create(obj_hero);
	alarm[0]=time_before_activating;
}
