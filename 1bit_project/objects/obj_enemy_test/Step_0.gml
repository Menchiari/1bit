if state=states.hit
{
	if dead=false
	{
		instance_create_depth(x,y,-y,obj_fx_blood);
		instance_create_depth(x,y,-y,obj_fx_flash);
		dead=true;
	}
	else
	{
		var dead_man=instance_create_depth(x,y,-y,obj_dead);
		dead_man.death_1_a=66;
		dead_man.death_1_b=76;
		dead_man.death_2_a=77;
		dead_man.death_2_b=86;
		dead_man.death_3_a=86;
		dead_man.death_3_b=105;
		dead_man.death_a=0;
		dead_man.death_b=0;
		instance_destroy();
	}
}