/// @description 
draw_sprite(sprite_index,0,x,y);

draw_set_font(fnt_dialogue);
draw_set_halign(fa_center);
draw_set_valign(fa_top);


//draw text about name

draw_text(x+(sprite_width/2),y,"strength: "+string_format(strength1,0,1)+"/"+string_format(strength2,0,1));
draw_text(x+(sprite_width/2),y+7,"resistance: "+string_format(resistance,0,1));
draw_text(x+round(sprite_width/2),y+14,"weight: +"+string_format(weight,0,0)+"kg");
draw_text(x+round(sprite_width/2),y+21,"speed: "+string_format(herospeed,0,1));
//draw text about age
//draw stats

// gamepad selection indicator
if (global.using_gamepad && variable_instance_exists(id, "menu_cursor"))
{
	draw_set_alpha(1);
	if (menu_cursor >= 1 && menu_cursor <= 3)
	{
		var _target_type = 3 - menu_cursor;
		with (obj_ui_menu_button_gear)
		{
			if (type == _target_type)
			{ draw_rectangle(x-1, y-1, x+sprite_width+1, y+sprite_height+1, true); }
		}
	}
	if (menu_cursor == 4)
	{
		with (obj_ui_menu_button_charselect)
		{ draw_rectangle(x-1, y-1, x+sprite_width+1, y+sprite_height+1, true); }
	}
	if (menu_cursor == 0)
	{
		with (obj_ui_menu_button_room)
		{ draw_rectangle(x-1, y-1, x+sprite_width+1, y+sprite_height+1, true); }
	}
	// BUG 4: highlight for cursor 5 (reset/random row)
	if (menu_cursor == 5)
	{
		if (!variable_instance_exists(id, "menu_cursor_lr")) menu_cursor_lr = 0;
		if (menu_cursor_lr == 0 && instance_exists(obj_ui_menu_button_gotoreset))
		{
			with (obj_ui_menu_button_gotoreset)
			{ draw_rectangle(x-1, y-1, x+sprite_width+1, y+sprite_height+1, true); }
		}
		if (menu_cursor_lr == 1 && instance_exists(obj_ui_menu_button_random))
		{
			with (obj_ui_menu_button_random)
			{ draw_rectangle(x-1, y-1, x+sprite_width+1, y+sprite_height+1, true); }
		}
	}
}