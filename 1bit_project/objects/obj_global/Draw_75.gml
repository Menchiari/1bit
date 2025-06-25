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
//ScreenResolution
var scr_w = display_get_width();   // horizontal pixels
var scr_h = display_get_height();  // vertical pixels
var surf_w = surface_get_width(application_surface);
var surf_h = surface_get_height(application_surface);

draw_clear_alpha(c_black,1);              // paint the whole screen black

if enable
{
	shader_set(shader);
	shader_set_uniform_f(iResolution,res_x,res_y);
	shader_set_uniform_f(iGlobalTime,time);
	shader_set_uniform_f(palette,p);
	shader_set_uniform_f(gamma,g);
	shader_set_uniform_f(flicker,flk);
}
if instance_exists(obj_camera)
{
	draw_surface_stretched(application_surface,0,0,res_x,res_y);
	display_set_gui_size(res_x,res_y);
}
else
{
	surface_resize(application_surface,room_width,room_height);
	draw_surface_stretched(application_surface,0,0,res_x,res_y);
	display_set_gui_size(res_x,res_y);
}


shader_reset();