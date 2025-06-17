default_gamma=global.gamma_default;
gamma_multiplier=.87//.8;
reduction_speed=.033//.025;
start=irandom_range(0,3);
alarm[0]=start;
alarm[1]=start+10;

depth=global.depth_ui+1;

flash=true;
rot=random_range(-40,40);

sprite_index=spr_hero;
flash_x=x;
flash_y=y;
flash_dir=1;
flash_index=image_index;