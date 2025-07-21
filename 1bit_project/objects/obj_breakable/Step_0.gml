if hp<=0 {state=states.death;}
if random_frame==false {image_index=(1-(hp/hp_max))*(image_number-1);}

switch state
{
	case states.idle:
		x=x_orig;
		y=y_orig;
	break;
	case states.hit:
		var screenshake=instance_create(obj_fx_screenshake);
		screenshake.shake=shake_power;
		timer=0;
		state=states.block;
		invincible=true;
	break;
	case states.block:
		timer+=1;
		x=x_orig+(random_range(shake_power+shake_power_hit,-shake_power-shake_power_hit)*shake_power_multiplier);
		y=y_orig+(random_range(shake_power+shake_power_hit,-shake_power-shake_power_hit)*shake_power_multiplier);
		if timer>shake_time
		{
			state=states.idle;
			invincible=false;
		}
	break;
	case states.death:
		var screenshaker=instance_create(obj_fx_screenshake);
		screenshaker.shake=shake_power*2;
		repeat(irandom_range(debris_min,debris_max))
		{instance_create_depth(x+(random_range(-debris_max,debris_max)),y-(random_range(0,debris_max)),-y,debris_type);}
		
		instance_destroy();
		
		// re-create the pathfinding grid since this instance will no longer be in it
		init_pathfinding_grid();
	break;
}