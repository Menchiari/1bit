/// @description 

// Inherit the parent event
event_inherited();

sprite_index=choose(spr_asset_chair1,spr_asset_chair_round,spr_asset_chair2);
image_xscale=choose(1,-1);
image_angle=random_range(-10,10);

hp_max=.5;
hp=hp_max;

//power of screenshake and object shake
shake_power=.25;

//amount of pieces
debris_min=5;
debris_max=6;

debris_type=obj_fx_debris_wood;