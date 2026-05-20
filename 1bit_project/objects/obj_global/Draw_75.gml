///@description Shader effect
#region fucked up code
/*
//original
if(enable)
&& room!=rm_menu
{
	shader_set(shader);
	shader_set_uniform_f(iResolution,res_x,res_y);
	shader_set_uniform_f(iGlobalTime,time);
	shader_set_uniform_f(palette,p);
	shader_set_uniform_f(gamma,g);
	shader_set_uniform_f(flicker,flk);
	draw_surface(application_surface,0,0);
	shader_reset();
	display_set_gui_size(res_x,res_y);
}
else
{
	draw_surface(application_surface,0,0);
	display_set_gui_size(res_x,res_y);
}
*/
///test 2
//shader_set(shader);
//shader_set_uniform_f(iResolution,res_x,res_y);
//shader_set_uniform_f(iGlobalTime,time);
//shader_set_uniform_f(palette,p);
//shader_set_uniform_f(gamma,g);
//shader_set_uniform_f(flicker,flk);
//draw_surface(application_surface,0,0);
//shader_reset();
//display_set_gui_size(res_x,res_y);
#endregion

draw_clear_alpha(c_black, 1);

if (global.widescreen)
{
	var _dw = display_get_width();
	var _dh = display_get_height();
	var _scale = floor(_dh / 320);
	if (_scale < 1) _scale = 1;
	var _game_w = res_x * _scale;
	var _game_h = res_y * _scale;
	var _game_x = floor((_dw - _game_w) / 2);
	var _game_y = floor((_dh - _game_h) / 2);

	// build panel surface: sprite + fade drawn raw (no shader yet)
	var _spw = sprite_get_width(global.sidepanel_sprite);
	var _sph = sprite_get_height(global.sidepanel_sprite);
	if (!surface_exists(global._panel_surf))
		global._panel_surf = surface_create(_spw, _sph);

	surface_set_target(global._panel_surf);
	draw_clear_alpha(c_black, 1);
	draw_sprite(global.sidepanel_sprite, 0, 0, 0);
	var _fade_alpha = 0;
	if (instance_exists(obj_fx_fadein)) _fade_alpha = obj_fx_fadein.alpha;
	if (instance_exists(obj_fx_fadeout)) _fade_alpha = obj_fx_fadeout.alpha;
	if (_fade_alpha > 0)
	{
		draw_set_alpha(_fade_alpha);
		draw_rectangle_color(0, 0, _spw, _sph, 0, 0, 0, 0, false);
		draw_set_alpha(1);
	}
	surface_reset_target();

	// now set GUI size and shader
	display_set_gui_size(_dw, _dh);
	if enable
	{
		shader_set(shader);
		shader_set_uniform_f(iResolution, res_x, res_y);
		shader_set_uniform_f(iGlobalTime, time);
		shader_set_uniform_f(palette, p);
		shader_set_uniform_f(gamma, g);
		shader_set_uniform_f(flicker, flk);
	}

	// panels through shader (fade already baked into surface as gray values)
	draw_surface_ext(global._panel_surf, _game_x, _game_y, -_scale, _scale, 0, c_white, 1);
	draw_surface_ext(global._panel_surf, _game_x + _game_w, _game_y, _scale, _scale, 0, c_white, 1);

	// gameplay through shader (fade already baked by fade objects)
	if instance_exists(obj_camera)
	{
		draw_surface_stretched(application_surface, _game_x, _game_y, _game_w, _game_h);
	}
	else
	{
		surface_resize(application_surface, room_width, room_height);
		draw_surface_stretched(application_surface, _game_x, _game_y, _game_w, _game_h);
	}

	shader_reset();
}
else
{
	if enable
	{
		shader_set(shader);
		shader_set_uniform_f(iResolution, res_x, res_y);
		shader_set_uniform_f(iGlobalTime, time);
		shader_set_uniform_f(palette, p);
		shader_set_uniform_f(gamma, g);
		shader_set_uniform_f(flicker, flk);
	}

	if instance_exists(obj_camera)
	{
		draw_surface_stretched(application_surface, 0, 0, res_x, res_y);
		display_set_gui_size(res_x, res_y);
	}
	else
	{
		surface_resize(application_surface, room_width, room_height);
		draw_surface_stretched(application_surface, 0, 0, res_x, res_y);
		display_set_gui_size(res_x, res_y);
	}

	shader_reset();
}