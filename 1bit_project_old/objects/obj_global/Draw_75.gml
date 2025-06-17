///@description Shader effect
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