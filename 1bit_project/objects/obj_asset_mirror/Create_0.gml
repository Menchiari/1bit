/// @description 

// Inherit the parent event
event_inherited();

sprite_index=choose(spr_asset_crate1,spr_asset_crate2,spr_asset_crate3);
image_xscale=choose(1,-1);
image_angle=random_range(-5,5);

hp_max=1;
hp=hp_max;

//power of screenshake and object shake
shake_power=.5;

//amount of pieces
debris_min=6;
debris_max=8;

debris_type=obj_fx_debris_wood;