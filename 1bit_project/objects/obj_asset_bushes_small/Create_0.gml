/// @description 

// Inherit the parent event
event_inherited();

hp_max=random_range(.5,1);

//power of screenshake and object shake
shake_power=0;
shake_power_hit=.5;

//amount of pieces
debris_min=15;
debris_max=20;

debris_type=obj_fx_debris_wood;

random_frame=true;

image_xscale=random_range(image_xscale*.9,image_xscale*1.1);
image_yscale=random_range(image_yscale*.9,image_yscale*1.1);
image_angle=image_angle*random_range(-10,10);