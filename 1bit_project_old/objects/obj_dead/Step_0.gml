if dead==true
{
	image_speed=random_range(.05,.4);
	//if round(image_index)%2==1 {color=color_a;}
	//else if round(image_index)%2==0 {color=color_b;}
	if round(image_index)==death_a {color=c_red;}
	else {color=c_white;}
	if image_index>death_b-1 {image_index=death_b-1; image_speed=0; dead=false; color=c_white;}
}