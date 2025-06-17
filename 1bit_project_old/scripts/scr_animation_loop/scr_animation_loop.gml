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