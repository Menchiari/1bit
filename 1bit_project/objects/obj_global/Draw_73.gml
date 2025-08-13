if display_mouse==true
{
	draw_circle_color(mouse_x,mouse_y,4,c_black,c_white,1)
	draw_point_color(mouse_x,mouse_y,c_white);
	draw_point_color(mouse_x,mouse_y+1,c_black);
}

//Main UI - deactivate rooms with no UI here

//hp line variables
var thickness=5//6;
var line_thickness=4;
var height=6//8;

if UI==true
{
	var border=2;
	var bordercolor=c_gray;
	//draw_rectangle_color(border,border,room_width-border,room_height-border,c_white,c_white,c_white,c_white,true);
	var camx=camera_get_view_x(view_get_camera(view_current));
	var camy=camera_get_view_y(view_get_camera(view_current));
	var camwidth=182//camera_get_view_width(view_camera[0]); //res_x; //room_width//180//camera_get_view_width(view_get_camera(view_current));
	var camheight=320//camera_get_view_height(view_camera[0]); //res_y; //room_height//320//camera_get_view_height(view_get_camera(view_current));
	
	if instance_exists(obj_camera)
	{
		camx=obj_camera.x;
		camy=obj_camera.y;
		draw_rectangle_color(camx-(camwidth/2)+border,camy-(camheight/2)+border,camx+(camwidth/2)-(border*2),camy+(camheight/2)-(border*2),bordercolor,bordercolor,bordercolor,bordercolor,true);
		//Hero UI
		if instance_exists(obj_hero)
		{
			draw_set_font(fnt_dialogue);
		//health
			////border
			//draw_rectangle_color(camwidth/2,camheight-thickness-line_thickness-height,camwidth/2+(camwidth/2*obj_hero.hp/obj_hero.hp_max)-(border*2),camheight-height,0,0,0,0,false);
			//draw_rectangle_color(camwidth/2-(camwidth/2*obj_hero.hp/obj_hero.hp_max)+border,camheight-thickness-line_thickness-height,camwidth/2,camheight-height,0,0,0,0,false);
			//healthbar
			draw_rectangle_color(camx-1,camy+(camheight/2)-thickness-height,camx+(camwidth/2*obj_hero.hp/obj_hero.hp_max)-line_thickness-(border*2),camy+(camheight/2)-line_thickness-height,bordercolor,bordercolor,bordercolor,bordercolor,false);
			draw_rectangle_color(camx+1,camy+(camheight/2)-thickness-height,camx-(camwidth/2*obj_hero.hp/obj_hero.hp_max)+line_thickness+(border*2),camy+(camheight/2)-line_thickness-height,bordercolor,bordercolor,bordercolor,bordercolor,false);
			
		var hp_text_x = camwidth/2-1;
		var hp_text_y = camy+(camheight/2)-(height*2);
		var hp_text = string(round(obj_hero.hp*10))+"/"+string(round(obj_hero.hp_max*10))//string(round(100*(obj_hero.hp/obj_hero.hp_max)))
		var hp_text_color = c_ltgray;
			
			if obj_hero.hp/obj_hero.hp_max < .25 hp_text_color = c_red;

			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text_ext_color(camx,hp_text_y+1,hp_text,6,100,0,0,0,0,1);
			draw_text_ext_color(camx,hp_text_y-1,hp_text,6,100,0,0,0,0,1);
			draw_text_ext_color(camx-1,hp_text_y+1,hp_text,6,100,0,0,0,0,1);
			draw_text_ext_color(camx-1,hp_text_y-1,hp_text,6,100,0,0,0,0,1);
			draw_text_ext_color(camx-1,hp_text_y,hp_text,6,100,0,0,0,0,1);
			draw_text_ext_color(camx+1,hp_text_y+1,hp_text,6,100,0,0,0,0,1);
			draw_text_ext_color(camx+1,hp_text_y-1,hp_text,6,100,0,0,0,0,1);
			draw_text_ext_color(camx+1,hp_text_y,hp_text,6,100,0,0,0,0,1);
			draw_text_ext_color(camx-2,hp_text_y+1,hp_text,6,100,0,0,0,0,.8);
			draw_text_ext_color(camx-2,hp_text_y-1,hp_text,6,100,0,0,0,0,.8);
			draw_text_ext_color(camx+2,hp_text_y+1,hp_text,6,100,0,0,0,0,.8);
			draw_text_ext_color(camx+2,hp_text_y-1,hp_text,6,100,0,0,0,0,.8);
			
			draw_text_ext_color(camx,hp_text_y,hp_text,6,100,hp_text_color,hp_text_color,hp_text_color,hp_text_color,.68);
		//
			height=-3
			var pos_x=5+3
			var pos_a=3+2+height;
			var pos_b=9+2+height;
			var pos_c=15+2+height;
			var pos_d=21+2+height;
			var _spd=obj_hero.spd*(1-((obj_hero.armor.weight+obj_hero.helm.weight+obj_hero.weapon.weight)/100));
			var _res=obj_hero.res*(obj_hero.armor.defence+obj_hero.helm.defence);
			var _str=obj_hero.weapon.atk_dmg_light*obj_hero.str;
			var _str2=(obj_hero.weapon.atk_dmg_strong+obj_hero.weapon.atk_dmg_variation)*obj_hero.str;
		//XP
			draw_set_halign(fa_right);
			draw_set_valign(fa_top);
			draw_text_color_outline(camx+(camwidth/2)-pos_x,camy-(camheight/2)+pos_a,"XP "+string(round(global_xp)),c_white,1);
			draw_text_color_outline(camx+(camwidth/2)-pos_x,camy-(camheight/2)+pos_b,"spd "+string_format(_spd,0,1),c_white,1);
			draw_text_color_outline(camx+(camwidth/2)-pos_x,camy-(camheight/2)+pos_c,"res "+string_format(_res,0,1),c_white,1);
			draw_text_color_outline(camx+(camwidth/2)-pos_x,camy-(camheight/2)+pos_d,"str "+string_format((_str+_str2)/2,0,1),c_white,1);
		//EQUIP
			draw_set_halign(fa_left);
			draw_text_color_outline(camx-(camwidth/2)+pos_x,camy-(camheight/2)+pos_a,"equip:",c_white,1);
			draw_text_color_outline(camx-(camwidth/2)+pos_x,camy-(camheight/2)+pos_b,obj_hero.weapon.name,c_white,1);
			draw_text_color_outline(camx-(camwidth/2)+pos_x,camy-(camheight/2)+pos_c,obj_hero.armor.name,c_white,1);
			draw_text_color_outline(camx-(camwidth/2)+pos_x,camy-(camheight/2)+pos_d,obj_hero.helm.name,c_white,1);
		}
		
		
		// debug pathfinding grid
		//draw_set_alpha(0.3);
		//mp_grid_draw(global.pathfinding_grid);
		//draw_set_alpha(1);
	}
	
	else
	{
		camwidth=room_width; //room_width//180//camera_get_view_width(view_get_camera(view_current));
		camheight=room_height; //room_height//320//camera_get_view_height(view_get_camera(view_current));

		draw_rectangle_color(camx+border,camy+border,camwidth-(border*2),camheight-(border*2),c_white,c_white,c_white,c_white,true);

		//Hero UI
		if instance_exists(obj_hero)
		{
			draw_set_font(fnt_dialogue);
		//health
			//border
			draw_rectangle_color(camwidth/2,camheight-thickness-line_thickness-height,camwidth/2+(camwidth/2*obj_hero.hp/obj_hero.hp_max)-(border*2),camheight-height,0,0,0,0,false);
			draw_rectangle_color(camwidth/2-(camwidth/2*obj_hero.hp/obj_hero.hp_max)+border,camheight-thickness-line_thickness-height,camwidth/2,camheight-height,0,0,0,0,false);
			//healthbar
			draw_rectangle_color(camwidth/2-1,camheight-thickness-height,camwidth/2+(camwidth/2*obj_hero.hp/obj_hero.hp_max)-line_thickness-(border*2),camheight-line_thickness-height,bordercolor,bordercolor,bordercolor,bordercolor,false);
			draw_rectangle_color(camwidth/2+1-(camwidth/2*obj_hero.hp/obj_hero.hp_max)+line_thickness+border,camheight-thickness-height,camwidth/2,camheight-line_thickness-height,bordercolor,bordercolor,bordercolor,bordercolor,false);

		//
			var pos_x=5+3;
			var pos_a=3+2;
			var pos_b=9+2;
			var pos_c=15+2;
		//XP
			draw_set_halign(fa_right);
			draw_set_valign(fa_top);
			draw_text_color_outline(camwidth-pos_x,camx+pos_a,"XP "+string(round(global_xp)),c_white,1);
			//draw_text_color_outline(camwidth-pos_x,camx+pos_b,"LIVES "+string(global.player_lives),c_white,1);
		//EQUIP
			draw_set_halign(fa_left);
			draw_text_color_outline(camx+pos_x,camy+pos_a,obj_hero.weapon.name,c_white,1);
			draw_text_color_outline(camx+pos_x,camy+pos_b,obj_hero.armor.name,c_white,1);
			if obj_hero.helm!=global_helms[0] {draw_text_color_outline(camx+pos_x,camy+pos_c,obj_hero.helm.name,c_white,1);}
		}
	}


}