if active==1
{	
	if shop_active==1
	{
		if instance_exists(obj_fx_vignette) {obj_fx_vignette.x=x;obj_fx_vignette.y=y;}
		draw_sprite(spr_ui_shop_base,0,x,y);
		draw_sprite(spr_ui_shop_selection,chosen_column,x,y);
		draw_sprite(spr_ui_shop_button,button_pressed,x,y);
		
		slot_sprite[0]=weapon_sprite; //spr_null;
		slot_sprite[1]=armor.sprite;
		slot_sprite[2]=helm.sprite;
		
		//sprite_set_offset(slot_sprite[0],16,16);
		draw_sprite(slot_sprite[0],0,x-32,y-78);
		//sprite_set_offset(slot_sprite[1],16,16);
		if armor.sprite!=character_body {draw_sprite(slot_sprite[1],0,x-3,y-82);}
		//sprite_set_offset(slot_sprite[2],16,16);
		if helm.sprite!=character_head {draw_sprite(slot_sprite[2],0,x+26,y-77);}

		draw_set_font(fnt_shop);
		draw_set_color(shop_text_color);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		var shop_text_printed=shop_text;
		if chosen_column==3 {shop_text_printed=shop_text_cancel;}
		if button_pressed==0 {draw_text_color(x-xoff+65,y-yoff+76,shop_text_printed,shop_text_color,shop_text_color,shop_text_color,shop_text_color,1);}
		else {draw_text_color(x-xoff+65,y-yoff+79,shop_text_printed,shop_text_color,shop_text_color,shop_text_color,shop_text_color,1);}
		
		draw_set_font(fnt_dialogue);
		switch(chosen_column)
		{
			case 0:
				draw_text(x-xoff+63,y-yoff+19,weapon.name);
				if weapon.bullets==0 {var wpn_type="type: melee";}
				else {var wpn_type="bullets: "+string(weapon.bullets);}
				if stats==false
				{
					draw_set_halign(fa_center);
					draw_text_ext(x-xoff+63,y-yoff+53,weapon.description,6,87);
				}
				else
				{
					draw_set_halign(fa_left);
					draw_text_ext(x-xoff+23,y-yoff+53,
					"strength: "+string(weapon.atk_dmg_light)+"~"+string(weapon.atk_dmg_strong+weapon.atk_dmg_variation)
					+"\n"+"speed: "+string(weapon.atk_spd*100)+"%"
					+"\n"+"weight: "+string(weapon.weight)+"Kg"
					+"\n"+wpn_type,6,87);
				}
			break;
			case 1:
				draw_text(x-xoff+63,y-yoff+19,armor.name);
				if stats==false
				{
					draw_set_halign(fa_center);
					draw_text_ext(x-xoff+63,y-yoff+53,armor.description,6,87);
				}
				else 
				{
					draw_set_halign(fa_left);
					draw_text_ext(x-xoff+23,y-yoff+53,
					"resistance: "+string(armor.defence)
					+"\n"+"weight: "+string(armor.weight)+"Kg"
					+"\n"+"charisma: "+string(armor.charisma),6,87);
				}
			break;
			case 2:
				draw_text(x-xoff+63,y-yoff+19,helm.name);
				if stats==false
				{
					draw_set_halign(fa_center);
					draw_text_ext(x-xoff+63,y-yoff+53,helm.description,6,87);
				}
				else 
				{
					draw_set_halign(fa_left);
					draw_text_ext(x-xoff+23,y-yoff+53,
					"resistance: "+string(helm.defence)
					+"\n"+"weight: "+string(helm.weight)+"Kg"
					+"\n"+"charisma: "+string(helm.charisma),6,87);
				}
			break;
			default:
				draw_text(x-xoff+63,y-yoff+19,name);
				if stats==true
				{
					draw_set_halign(fa_left);
					if description_str+description_res+description_spd>0
					{
						draw_text_ext(x-xoff+23,y-yoff+53,
						"strength: "+string(description_str)
						+"\n"+"resistance: "+string(description_res)
						+"\n"+"speed: "+string(description_spd*100)+"%"
						+"\n"+"charisma: "+string(description_cha),6,87);
					}
					else{stats=false;}
				}
				else
				{
					draw_set_halign(fa_center);
					draw_text_ext(x-xoff+63,y-yoff+53,description,6,87);
				}
			break;
		}
		
		draw_set_color(image_blend);
	}
	else
	{
		draw_sprite(spr_ui_shop_arrow,image_index,x,y);
	}
}

//draw_circle(x,y,active_range,true);
//draw_circle(x,y,reactive_range,true);
//draw_circle(x,y,radius,true);