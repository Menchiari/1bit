image_index=irandom_range(0,image_number-1);
image_speed=0;

spd=random_range(2,15);
speed_friction=random_range(1.3,1.5);
dirx=random_range(1,-1);
diry=random_range(1,-1);

scale_x=random_range(.1,.4);
scale_y=random_range(.05,.2);
rot=random_range(0,360);
color=choose(c_white,c_ltgray);
alpha=random_range(.3,5);
alarm[0]=irandom_range(0,3);