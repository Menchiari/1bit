/// @description loops animation
if loop=true {if image_index>end_frame image_index=start_frame;}
else {if image_index==end_frame && once==true {image_speed=0; alarm[0]=1; once=false;}}
depth=-y;