/// @description 

// Inherit the parent event
event_inherited();

hp_max=random_range(2,3);

//power of screenshake and object shake
shake_power=0;
shake_power_hit=1;

//amount of pieces
debris_min=8;
debris_max=12;

debris_type=obj_fx_debris_wood;

image_xscale=random_range(image_xscale*.9,image_xscale*1.1);
image_yscale=random_range(image_yscale*.9,image_yscale*1.1);
image_angle=image_angle*random_range(-10,10);