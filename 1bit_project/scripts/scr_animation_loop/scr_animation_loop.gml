function scr_animation_loop(start_frame,end_frame)
{
	if image_index>end_frame || image_index<start_frame image_index=start_frame;
}
function scr_animation(start_frame,end_frame)
{
	if image_index>end_frame {image_index=start_frame;}
	else if image_index<start_frame {image_index=start_frame;}
	else if round(image_index)>=end_frame-1 {image_index=end_frame-1;}
}
function scr_animation_reverse(min_frame,max_frame,anim_speed_notneg)
{
	image_speed=-anim_speed_notneg;
	if image_index>max_frame+1 || image_index<min_frame-1 image_index=max_frame
	if image_index<=min_frame && image_index>=min_frame-1 image_index=min_frame
}