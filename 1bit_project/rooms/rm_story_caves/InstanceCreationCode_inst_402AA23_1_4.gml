if instance_exists(obj_hero)
{
	with obj_hero
	{	
		trigger_spawn=false;
		state=states.idle;
		speech_text="ouch...";
	}
}