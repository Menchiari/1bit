depth=global.depth_floor;
image_index=irandom_range(0,image_number-1);
image_speed=0;
bodyspawn=true;
alarm[0]=1;

scale_x=random_range(.3,.7);
scale_y=random_range(.1,.4);
rot=random_range(-10,10);
color=global.blood_color;
alpha=random_range(.25,.8);

if collision_point(x,y,obj_trigger_deathfall,true,true) {bodyspawn=false;}