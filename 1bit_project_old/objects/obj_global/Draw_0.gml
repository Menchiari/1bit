if display_mouse==true
{
	draw_circle_color(mouse_x,mouse_y,4,c_black,c_white,1)
	draw_point_color(mouse_x,mouse_y,c_white);
	draw_point_color(mouse_x,mouse_y+1,c_black);
}

//Main UI
if UI==true
&& room!=rm_death
{
	var border=2;
	//draw_rectangle_color(border,border,room_width-border,room_height-border,c_white,c_white,c_white,c_white,true);
	var camx=camera_get_view_x(view_get_camera(view_current));
	var camy=camera_get_view_y(view_get_camera(view_current));
	var camwidth=global.res_x; //room_width//180//camera_get_view_width(view_get_camera(view_current));
	var camheight=global.res_y; //room_height//320//camera_get_view_height(view_get_camera(view_current));
	
	if instance_exists(obj_camera)
	{
		camx=obj_camera.x;
		camy=obj_camera.y;
		draw_rectangle_color(camx-(camwidth/2)+border,camy-(camheight/2)+border,camx+(camwidth/2)-(border*2),camy+(camheight/2)-(border*2),c_white,c_white,c_white,c_white,true);
		//Hero UI
		if instance_exists(obj_hero)
		{
			draw_set_font(fnt_dialogue);
		//health
			var thickness=6;
			var line_thickness=2;
			var height=8;
			////border
			//draw_rectangle_color(camwidth/2,camheight-thickness-line_thickness-height,camwidth/2+(camwidth/2*obj_hero.hp/obj_hero.hp_max)-(border*2),camheight-height,0,0,0,0,false);
			//draw_rectangle_color(camwidth/2-(camwidth/2*obj_hero.hp/obj_hero.hp_max)+border,camheight-thickness-line_thickness-height,camwidth/2,camheight-height,0,0,0,0,false);
			//healthbar
			draw_rectangle_color(camx-1,camy+(camheight/2)-thickness-height,camx+(camwidth/2*obj_hero.hp/obj_hero.hp_max)-line_thickness-(border*2),camy+(camheight/2)-line_thickness-height,c_white,c_white,c_white,c_white,false);
			draw_rectangle_color(camx+1,camy+(camheight/2)-thickness-height,camx-(camwidth/2*obj_hero.hp/obj_hero.hp_max)+line_thickness+(border*2),camy+(camheight/2)-line_thickness-height,c_white,c_white,c_white,c_white,false);

		//debug todo remove
			var height=-3
			var pos_x=5+3;
			var pos_a=3+2+height;
			var pos_b=9+2+height;
			var pos_c=15+2+height;
			var pos_d=21+2+height;
		//XP
			draw_set_halign(fa_right);
			draw_set_valign(fa_top);
			draw_text_color_outline(camx+(camwidth/2)-pos_x,camy-(camheight/2)+pos_a,"XP "+string(round(global.xp)),c_white,1);
			draw_text_color_outline(camx+(camwidth/2)-pos_x,camy-(camheight/2)+pos_b,"spd "+string(obj_hero.spd),c_white,1);
			draw_text_color_outline(camx+(camwidth/2)-pos_x,camy-(camheight/2)+pos_c,"res "+string(obj_hero.res),c_white,1);
			draw_text_color_outline(camx+(camwidth/2)-pos_x,camy-(camheight/2)+pos_d,"str "+string(obj_hero.str),c_white,1);
		//EQUIP
			draw_set_halign(fa_left);
			draw_text_color_outline(camx-(camwidth/2)+pos_x,camy-(camheight/2)+pos_a,"equip:",c_white,1);
			draw_text_color_outline(camx-(camwidth/2)+pos_x,camy-(camheight/2)+pos_b,obj_hero.weapon.name,c_white,1);
			draw_text_color_outline(camx-(camwidth/2)+pos_x,camy-(camheight/2)+pos_c,obj_hero.armor.name,c_white,1);
			draw_text_color_outline(camx-(camwidth/2)+pos_x,camy-(camheight/2)+pos_d,obj_hero.helm.name,c_white,1);
		}
	}
	
	else
	{
		draw_rectangle_color(camx+border,camy+border,camwidth-(border*2),camheight-(border*2),c_white,c_white,c_white,c_white,true);

		//Hero UI
		if instance_exists(obj_hero)
		{
			draw_set_font(fnt_dialogue);
		//health
			var thickness=6;
			var line_thickness=2;
			var height=8;
			//border
			draw_rectangle_color(camwidth/2,camheight-thickness-line_thickness-height,camwidth/2+(camwidth/2*obj_hero.hp/obj_hero.hp_max)-(border*2),camheight-height,0,0,0,0,false);
			draw_rectangle_color(camwidth/2-(camwidth/2*obj_hero.hp/obj_hero.hp_max)+border,camheight-thickness-line_thickness-height,camwidth/2,camheight-height,0,0,0,0,false);
			//healthbar
			draw_rectangle_color(camwidth/2-1,camheight-thickness-height,camwidth/2+(camwidth/2*obj_hero.hp/obj_hero.hp_max)-line_thickness-(border*2),camheight-line_thickness-height,c_white,c_white,c_white,c_white,false);
			draw_rectangle_color(camwidth/2+1-(camwidth/2*obj_hero.hp/obj_hero.hp_max)+line_thickness+border,camheight-thickness-height,camwidth/2,camheight-line_thickness-height,c_white,c_white,c_white,c_white,false);

		//debug todo remove
			var pos_x=5+3;
			var pos_a=3+2;
			var pos_b=9+2;
			var pos_c=15+2;
		//XP
			draw_set_halign(fa_right);
			draw_set_valign(fa_top);
			draw_text_color_outline(camwidth-pos_x,camx+pos_a,"XP "+string(round(global.xp)),c_white,1);
			//draw_text_color_outline(camwidth-pos_x,camx+pos_b,"LIVES "+string(global.player_lives),c_white,1);
		//EQUIP
			draw_set_halign(fa_left);
			draw_text_color_outline(camx+pos_x,camy+pos_a,obj_hero.weapon.name,c_white,1);
			draw_text_color_outline(camx+pos_x,camy+pos_b,obj_hero.armor.name,c_white,1);
			if obj_hero.helm!=global.helms[0] {draw_text_color_outline(camx+pos_x,camy+pos_c,obj_hero.helm.name,c_white,1);}
		}
	}


}