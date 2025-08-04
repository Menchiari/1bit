/// @description deactivate hero
if instance_exists(obj_hero)
{
	obj_hero.x=x;obj_hero.y=y;
	with (obj_hero)
	{
		state=states.null;
		control=controls.null;
		speech_text="";
		speed=0;
		visible = false;
		path_end();
	}
	depth=obj_hero.depth;
	alarm[0]=time_before_activating;
}
else
{
	instance_create(obj_hero);
	alarm[2]=1;
	alarm[0]=time_before_activating;
}
