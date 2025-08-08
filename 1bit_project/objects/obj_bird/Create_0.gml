state=0;
idle_a=0;
idle_b=1;
takeoff_a=2;
takeoff_b=5;
fly_a=6;
fly_b=12;
flying_speed_anim=random_range(1,2);

fly_speed_x=random_range(-2.5,2.5);
fly_speed_y=random_range(-1.5,-4);

active_range=random_range(80,120);

x_origin=x;
y_origin=y;

image_xscale=choose(-1,1);
image_alpha=random_range(0.5,1);

active=false;

var _random_death = random_range(0,100);
if _random_death<30 instance_destroy();