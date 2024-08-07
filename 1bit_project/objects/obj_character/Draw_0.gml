if active==true {

//draw effects under character
	draw_sprite_ext(sprite_back,image_index,x,y,dir*size,-1*size,char_rot,main_color,.2);//reflection
	draw_sprite_ext(sprite_light,image_index,x,y,1*dir*size,.75*size,char_rot,c_white,.4);//light
	draw_sprite_ext(sprite_shadow,image_index,x,y,1*dir*size,.75*size,char_rot,c_white,.75);//shadow

//draw character

//back image
	if back==true
	{
		draw_sprite_shadow(sprite_skin,image_index,x,y,dir*size,1*size,skin_color,0,0,.5,2);
		
		scr_tracker_body(image_index);
		var body_offsetx=(tposx*dir*size)-((sprite_width/2)*dir*size);
		var body_offsety=(tposy*size)-(27*size);	
		if sprite_body==character_body
		{
			draw_sprite_ext(sprite_body,1,x+body_offsetx,y+body_offsety,(tscalex/5)*size*dir,(tscaley/6)*size,trot*char_rot,skin_color,1);
			//draw_sprite_ext(sprite_back,image_index,x,y,dir*size,1*size,char_rot,skin_color,1);
		}
		else 
		{
			draw_sprite_ext(sprite_body,1,x+body_offsetx,y+body_offsety,(tscalex/5)*size*dir,(tscaley/6)*size,trot*char_rot,main_color,1);
			//draw_sprite_ext(sprite_back,image_index,x,y,dir*size,1*size,char_rot,main_color,1);
		}
		
		scr_tracker(image_index);
		var offsetx=(tposx*dir*size)-((sprite_width/2)*dir*size);
		var offsety=(tposy*size)-(27*size);
		if helm.sprite==character_head {draw_sprite_shadow(helm.sprite,1,x+offsetx,y+offsety,(tscalex/3)*dir,(tscaley/3),skin_color,0,0,1,1);}
		else {draw_sprite_shadow(helm.sprite,1,x+offsetx,y+offsety,(tscalex/3)*dir,(tscaley/3),main_color,0,0,1,1);}

		draw_sprite_ext(sprite_back,image_index,x,y,dir*size,1*size,char_rot,skin_color,1);
		draw_sprite_ext(sprite_back,image_index,x,y,dir*size,1*size,char_rot,skin_color,1);
		//draw_sprite_ext(helm.sprite,0,x+offsetx,y+offsety,(tscalex/3)*size*dir,(tscaley/3)*size,trot*char_rot,main_color,1);
	}
	else
	{
		draw_sprite_shadow(sprite_skin,image_index,x,y,dir*size,1*size,skin_color,0,0,.5,1);
		scr_tracker_body(image_index);
		var body_offsetx=(tposx*dir*size)-((sprite_width/2)*dir*size);
		var body_offsety=(tposy*size)-(27*size);
		if sprite_body==character_body {draw_sprite_ext(sprite_body,0,x+body_offsetx,y+body_offsety,(tscalex/5)*size*dir,(tscaley/6)*size,trot*char_rot,skin_color,1);}
		else {draw_sprite_ext(sprite_body,0,x+body_offsetx,y+body_offsety,(tscalex/5)*size*dir,(tscaley/6)*size,trot*char_rot,main_color,1);}
		scr_tracker(image_index);
		var offsetx=(tposx*dir*size)-((sprite_width/2)*dir*size);
		var offsety=(tposy*size)-(27*size);
		if helm.sprite==character_head {draw_sprite_shadow(helm.sprite,0,x+offsetx,y+offsety,(tscalex/3)*dir,(tscaley/3),skin_color,0,0,.5,.5);}
		else {draw_sprite_shadow(helm.sprite,0,x+offsetx,y+offsety,(tscalex/3)*dir,(tscaley/3),main_color,0,0,1,1);}
		//draw_sprite_ext(helm.sprite,0,x+offsetx,y+offsety,(tscalex/3)*size*dir,(tscaley/3)*size,trot*char_rot,main_color,1);
	}

//rimlight
	draw_sprite_ext(sprite_back,image_index,x+.5,y+.5,dir*size,1*size,char_rot,c_black,.1);
	
//hit effect
	if round(image_index)==idle_hit_a
	{
		draw_sprite_ext(spr_hero_shadow,image_index,x-2.5,y,dir*size,1*size,char_rot,c_red,.4);
		draw_sprite_ext(spr_hero_shadow,image_index,x,y,dir*size,1*size,char_rot,c_red,.4);
		draw_sprite_ext(spr_hero_shadow,image_index,x+2.5,y,dir*size,1*size,char_rot,c_red,.4);
	}

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

//debug
//draw_path(walking_path,x,y,false);
