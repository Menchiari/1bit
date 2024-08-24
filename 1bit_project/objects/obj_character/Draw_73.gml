/// @description GUI Text
if active==true
{
	//text
	var drawgui_divider=1;
	var separation=round(6*drawgui_divider); //sitance between text lines
	var maxpixels=150*drawgui_divider; //how long the text line in pixels
	var text_x=x*drawgui_divider//camera_get_view_width(view_current);//x;
	var text_y=y*drawgui_divider///camera_get_view_height(view_current);;//y;
	var txt_height=22*drawgui_divider;
	
	var text=speech_text;
	var text_scale=1;
	var colft=speech_color;
	var colbk=speech_color_bk;
	
	if speech_visible==true
	{
		draw_set_font(fnt_dialogue);
		draw_set_valign(fa_bottom);
		draw_set_halign(fa_center);
	
		draw_text_ext_transformed_color(text_x+2,text_y+1-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		draw_text_ext_transformed_color(text_x+2,text_y-1-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		draw_text_ext_transformed_color(text_x-2,text_y+1-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		draw_text_ext_transformed_color(text_x-2,text_y-1-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		draw_text_ext_transformed_color(text_x+2,text_y+2-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		draw_text_ext_transformed_color(text_x+2,text_y-2-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		draw_text_ext_transformed_color(text_x-2,text_y+2-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		draw_text_ext_transformed_color(text_x-2,text_y-2-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);

		draw_text_ext_transformed_color(text_x+1,text_y+1-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		draw_text_ext_transformed_color(text_x+1,text_y-1-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		draw_text_ext_transformed_color(text_x-1,text_y+1-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		draw_text_ext_transformed_color(text_x-1,text_y-1-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		draw_text_ext_transformed_color(text_x+1,text_y+2-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		draw_text_ext_transformed_color(text_x+1,text_y-2-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		draw_text_ext_transformed_color(text_x-1,text_y+2-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		draw_text_ext_transformed_color(text_x-1,text_y-2-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);

		//draw_text_ext_transformed_color(text_x+1,text_y+1-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		//draw_text_ext_transformed_color(text_x+1,text_y-1-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		//draw_text_ext_transformed_color(text_x-1,text_y+1-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);
		//draw_text_ext_transformed_color(text_x-1,text_y-1-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colbk,colbk,colbk,colbk,1);

		draw_text_ext_transformed_color(round(text_x),text_y-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colft,colft,colft,colft,1);
	}
	
	//text="ai="+string(ai_state);
	//draw_text_ext_transformed_color(text_x,text_y-txt_height,text,separation,maxpixels,text_scale,text_scale,0,colft,colft,colft,colft,1);
}