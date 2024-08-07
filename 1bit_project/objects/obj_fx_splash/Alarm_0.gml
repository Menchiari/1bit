xscale=choose(splash_size,-splash_size)+random_range(-splash_random,splash_random);
yscale=choose(splash_size,-splash_size)+random_range(-splash_random,splash_random);

if footprint==true
{
	var footprint_child=instance_create_depth(x,y,-y,footprint_obj);
	footprint_child.footprint_sprite=footprint_sprite;
	footprint_child.footprint_opacity=footprint_opacity;
	footprint_child.footprint_color=footprint_color;
	footprint_child.footprint_fade=footprint_fade;
	footprint_child.footprint_min=footprint_min;
}