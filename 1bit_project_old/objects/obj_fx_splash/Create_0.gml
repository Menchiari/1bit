splash_size=1;
splash_random=splash_size/2;

footprint=false;
footprint_sprite=spr_footprint_default;
footprint_obj=obj_fx_footprint_default;
footprint_opacity=1;
footprint_color=c_black;
footprint_fade=0;
footprint_min=0;

xscale=1//choose(splash_size,-splash_size)+random_range(-splash_random,splash_random);
yscale=1//choose(splash_size,-splash_size)+random_range(-splash_random,splash_random);

rotation=random_range(-10,10);

alarm[0]=1; //redefine variables